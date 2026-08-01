package com.voronkely.controller;

import com.lowagie.text.Document;
import com.lowagie.text.DocumentException;
import com.lowagie.text.Font;
import com.lowagie.text.FontFactory;
import com.lowagie.text.PageSize;
import com.lowagie.text.Paragraph;
import com.lowagie.text.Phrase;
import com.lowagie.text.pdf.PdfPCell;
import com.lowagie.text.pdf.PdfPTable;
import com.lowagie.text.pdf.PdfWriter;
import com.voronkely.entity.ActiviteCamp;
import com.voronkely.entity.Camp;
import com.voronkely.entity.CampInfo;
import com.voronkely.service.ActiviteCampService;
import com.voronkely.service.CampInfoService;
import com.voronkely.service.CampService;
import jakarta.servlet.http.HttpServletResponse;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/camp")
public class CampController {

    private final CampService campService;
    private final CampInfoService campInfoService;
    private final ActiviteCampService activiteCampService;

    public CampController(CampService campService, CampInfoService campInfoService,
            ActiviteCampService activiteCampService) {
        this.campService = campService;
        this.campInfoService = campInfoService;
        this.activiteCampService = activiteCampService;
    }

    @GetMapping
    public String pageCamp(Model model) {
        model.addAttribute("camps", campService.findAll());
        return "camp/page-camp";
    }

    @GetMapping("/nouveau")
    public String nouveauCamp(Model model) {
        model.addAttribute("camp", new Camp());
        return "camp/camp-form";
    }

    @PostMapping
    public String enregistrerCamp(@RequestParam String titre,
            @RequestParam(required = false) String dateDebut,
            @RequestParam(required = false) String dateFin,
            @RequestParam(required = false) String lieu) {
        Camp camp = new Camp();
        camp.setTitre(titre);
        camp.setLieu(lieu);
        if (dateDebut != null && !dateDebut.isBlank()) {
            camp.setDateDebut(LocalDate.parse(dateDebut));
        }
        if (dateFin != null && !dateFin.isBlank()) {
            camp.setDateFin(LocalDate.parse(dateFin));
        }
        campService.save(camp);
        return "redirect:/camp";
    }

    @GetMapping("/{id}")
    public String gestionCampInfo(@PathVariable Long id, Model model) {
        var opt = campService.findById(id);
        if (opt.isEmpty()) {
            return "redirect:/camp";
        }
        Camp camp = opt.get();
        model.addAttribute("camp", camp);
        campInfoService.findByCampId(id).ifPresent(info -> model.addAttribute("campInfo", info));
        return "camp/gestion-camp-info";
    }

    @GetMapping("/{id}/info/nouveau")
    public String nouveauCampInfo(@PathVariable Long id, Model model) {
        var campOpt = campService.findById(id);
        if (campOpt.isEmpty()) {
            return "redirect:/camp";
        }
        Camp camp = campOpt.get();
        model.addAttribute("camp", camp);
        CampInfo campInfo = campInfoService.findByCampId(id).orElse(new CampInfo());
        model.addAttribute("campInfo", campInfo);
        return "camp/camp-info-form";
    }

    @PostMapping("/{id}/info")
    public String saveCampInfo(@PathVariable Long id,
            @RequestParam(required = false) String sampana,
            @RequestParam(required = false) String faritany,
            @RequestParam(required = false) String faritra,
            @RequestParam(required = false) String fivondronana,
            @RequestParam(required = false) String andiany,
            @RequestParam(required = false) String tarigetra,
            @RequestParam(required = false) String teninAndriamanitra,
            @RequestParam(required = false) String objectif,
            @RequestParam(required = false) String fandraharahana,
            @RequestParam(required = false) String fitaovana,
            @RequestParam(required = false) String araPanahy,
            @RequestParam(required = false) String fientanana,
            @RequestParam(required = false) String fahasalamana,
            @RequestParam(required = false) String isaMpilasy,
            @RequestParam(required = false) String fitanterana,
            @RequestParam(required = false) String toeranaHiaingana,
            @RequestParam(required = false) String toeranaHiverenana) {
        var campOpt = campService.findById(id);
        if (campOpt.isEmpty()) {
            return "redirect:/camp";
        }
        Camp camp = campOpt.get();
        CampInfo info = campInfoService.findByCampId(id).orElse(new CampInfo());
        info.setCamp(camp);
        info.setSampana(sampana);
        info.setFaritany(faritany);
        info.setFaritra(faritra);
        info.setFivondronana(fivondronana);
        info.setAndiany(andiany);
        info.setTarigetra(tarigetra);
        info.setTeninAndriamanitra(teninAndriamanitra);
        info.setObjectif(objectif);
        info.setFandraharahana(fandraharahana);
        info.setFitaovana(fitaovana);
        info.setAraPanahy(araPanahy);
        info.setFientanana(fientanana);
        info.setFahasalamana(fahasalamana);
        if (isaMpilasy != null && !isaMpilasy.isBlank()) {
            try {
                info.setIsaMpilasy(Integer.valueOf(isaMpilasy));
            } catch (NumberFormatException e) {
                info.setIsaMpilasy(null);
            }
        } else {
            info.setIsaMpilasy(null);
        }
        info.setFitanterana(fitanterana);
        info.setToeranaHiaingana(toeranaHiaingana);
        info.setToeranaHiverenana(toeranaHiverenana);

        campInfoService.save(info);
        return "redirect:/camp/" + id;
    }

    @GetMapping("/{id}/activites")
    public String listeActivitesCamp(@PathVariable Long id,
            @RequestParam(required = false) String typeMouvement,
            Model model) {
        var campOpt = campService.findById(id);
        if (campOpt.isEmpty()) {
            return "redirect:/camp";
        }
        Camp camp = campOpt.get();
        model.addAttribute("camp", camp);
        List<ActiviteCamp> activites;
        if (typeMouvement != null && !typeMouvement.isBlank()) {
            activites = activiteCampService.findByCampIdAndTypeMouvement(id, typeMouvement);
        } else {
            activites = activiteCampService.findByCampId(id);
        }
        BigDecimal totalEntree = BigDecimal.ZERO;
        BigDecimal totalSortie = BigDecimal.ZERO;
        for (ActiviteCamp act : activites) {
            if (act.getMontant() != null) {
                if ("entree".equalsIgnoreCase(act.getTypeMouvement())) {
                    totalEntree = totalEntree.add(act.getMontant());
                }
                if ("sortie".equalsIgnoreCase(act.getTypeMouvement())) {
                    totalSortie = totalSortie.add(act.getMontant());
                }
            }
        }
        model.addAttribute("activites", activites);
        model.addAttribute("totalEntree", totalEntree);
        model.addAttribute("totalSortie", totalSortie);
        model.addAttribute("selectedTypeMouvement", typeMouvement);
        return "camp/activite-camp";
    }

    @GetMapping("/{id}/activites/nouveau")
    public String nouveauActiviteCamp(@PathVariable Long id, Model model) {
        var campOpt = campService.findById(id);
        if (campOpt.isEmpty()) {
            return "redirect:/camp";
        }
        model.addAttribute("camp", campOpt.get());
        model.addAttribute("activite", new ActiviteCamp());
        return "camp/activite-camp-form";
    }

    @PostMapping("/{id}/activites")
    public String saveActiviteCamp(@PathVariable Long id,
            @RequestParam(required = false) String antony,
            @RequestParam(required = false) String quantite,
            @RequestParam(required = false) String prixUnitaire,
            @RequestParam(required = false) String montant,
            @RequestParam(required = false) String typeMouvement) {
        var campOpt = campService.findById(id);
        if (campOpt.isEmpty()) {
            return "redirect:/camp";
        }
        ActiviteCamp activite = new ActiviteCamp();
        activite.setCamp(campOpt.get());
        activite.setAntony(antony);
        activite.setTypeMouvement(typeMouvement);
        activite.setQuantite(parseDecimal(quantite));
        activite.setPrixUnitaire(parseDecimal(prixUnitaire));
        activite.setMontant(resolveMontant(montant, activite.getQuantite(), activite.getPrixUnitaire()));
        activiteCampService.save(activite);
        return "redirect:/camp/" + id + "/activites";
    }

    @GetMapping("/{id}/activites/{activiteId}/edit")
    public String editActiviteCamp(@PathVariable Long id, @PathVariable Long activiteId, Model model) {
        var campOpt = campService.findById(id);
        if (campOpt.isEmpty()) {
            return "redirect:/camp";
        }
        ActiviteCamp activite = activiteCampService.findById(activiteId).orElse(null);
        if (activite == null || activite.getCamp() == null || !activite.getCamp().getId().equals(id)) {
            return "redirect:/camp/" + id + "/activites";
        }
        model.addAttribute("camp", campOpt.get());
        model.addAttribute("activite", activite);
        return "camp/activite-camp-form";
    }

    @PostMapping("/{id}/activites/{activiteId}/edit")
    public String saveActiviteCampEdit(@PathVariable Long id, @PathVariable Long activiteId,
            @RequestParam(required = false) String antony,
            @RequestParam(required = false) String quantite,
            @RequestParam(required = false) String prixUnitaire,
            @RequestParam(required = false) String montant,
            @RequestParam(required = false) String typeMouvement) {
        var campOpt = campService.findById(id);
        if (campOpt.isEmpty()) {
            return "redirect:/camp";
        }
        ActiviteCamp activite = activiteCampService.findById(activiteId).orElse(null);
        if (activite == null || activite.getCamp() == null || !activite.getCamp().getId().equals(id)) {
            return "redirect:/camp/" + id + "/activites";
        }
        activite.setAntony(antony);
        activite.setTypeMouvement(typeMouvement);
        activite.setQuantite(parseDecimal(quantite));
        activite.setPrixUnitaire(parseDecimal(prixUnitaire));
        activite.setMontant(resolveMontant(montant, activite.getQuantite(), activite.getPrixUnitaire()));
        activiteCampService.save(activite);
        return "redirect:/camp/" + id + "/activites";
    }

    @GetMapping("/{id}/activites/{activiteId}/supprimer")
    public String supprimerActiviteCamp(@PathVariable Long id, @PathVariable Long activiteId) {
        ActiviteCamp activite = activiteCampService.findById(activiteId).orElse(null);
        if (activite != null && activite.getCamp() != null && activite.getCamp().getId().equals(id)) {
            activiteCampService.deleteById(activiteId);
        }
        return "redirect:/camp/" + id + "/activites";
    }

    @GetMapping("/{id}/activites/export/excel")
    public void exportActivitesCampExcel(@PathVariable Long id, HttpServletResponse response) throws IOException {
        var campOpt = campService.findById(id);
        if (campOpt.isEmpty()) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
            return;
        }
        List<ActiviteCamp> activites = activiteCampService.findByCampId(id);
        try (Workbook workbook = new XSSFWorkbook()) {
            Sheet sheet = workbook.createSheet("Activites Camp");
            Row header = sheet.createRow(0);
            String[] headers = { "Antony", "Quantité", "Prix unitaire", "Montant", "Type mouvement" };
            for (int i = 0; i < headers.length; i++) {
                header.createCell(i).setCellValue(headers[i]);
            }
            for (int i = 0; i < activites.size(); i++) {
                ActiviteCamp act = activites.get(i);
                Row row = sheet.createRow(i + 1);
                row.createCell(0).setCellValue(act.getAntony() != null ? act.getAntony() : "");
                row.createCell(1).setCellValue(act.getQuantite() != null ? act.getQuantite().toString() : "");
                row.createCell(2).setCellValue(act.getPrixUnitaire() != null ? act.getPrixUnitaire().toString() : "");
                row.createCell(3).setCellValue(act.getMontant() != null ? act.getMontant().toString() : "");
                row.createCell(4).setCellValue(act.getTypeMouvement() != null ? act.getTypeMouvement() : "");
            }
            for (int i = 0; i < headers.length; i++) {
                sheet.autoSizeColumn(i);
            }
            String fileName = "activites_camp_" + id + ".xlsx";
            response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
            response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\"");
            workbook.write(response.getOutputStream());
        }
    }

    @GetMapping("/{id}/export/pdf")
    public void exportCampPdf(@PathVariable Long id, HttpServletResponse response) throws IOException {
        var campOpt = campService.findById(id);
        if (campOpt.isEmpty()) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
            return;
        }
        Camp camp = campOpt.get();
        List<ActiviteCamp> activites = activiteCampService.findByCampId(id);
        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "attachment; filename=\"camp_" + id + ".pdf\"");
        Document document = new Document(PageSize.A4.rotate());
        try {
            PdfWriter.getInstance(document, response.getOutputStream());
            document.open();
            Font titleFont = FontFactory.getFont(FontFactory.HELVETICA_BOLD, 16);
            Font headingFont = FontFactory.getFont(FontFactory.HELVETICA_BOLD, 12);
            Font normalFont = FontFactory.getFont(FontFactory.HELVETICA, 10);
            document.add(new Paragraph("Camp: " + camp.getTitre(), titleFont));
            document.add(new Paragraph("Lieu : " + camp.getLieu(), normalFont));
            document.add(new Paragraph("Période : " + camp.getDateDebut() + " - " + camp.getDateFin(), normalFont));
            document.add(new Paragraph(" "));
            document.add(new Paragraph("Informations camp", headingFont));
            var infoOpt = campInfoService.findByCampId(id);
            if (infoOpt.isPresent()) {
                CampInfo info = infoOpt.get();
                document.add(new Paragraph("Sampana: " + info.getSampana(), normalFont));
                document.add(new Paragraph("Faritany: " + info.getFaritany(), normalFont));
                document.add(new Paragraph("Faritra: " + info.getFaritra(), normalFont));
                document.add(new Paragraph("Fivondronana: " + info.getFivondronana(), normalFont));
                document.add(new Paragraph("Andiany: " + info.getAndiany(), normalFont));
                document.add(new Paragraph("Tarigetra: " + info.getTarigetra(), normalFont));
                document.add(new Paragraph("Tenin'Andriamanitra: " + info.getTeninAndriamanitra(), normalFont));
                document.add(new Paragraph("Objectif: " + info.getObjectif(), normalFont));
                document.add(new Paragraph("Fandraharahana: " + info.getFandraharahana(), normalFont));
                document.add(new Paragraph("Fitaovana: " + info.getFitaovana(), normalFont));
                document.add(new Paragraph("Ara-panahy: " + info.getAraPanahy(), normalFont));
                document.add(new Paragraph("Fientanana: " + info.getFientanana(), normalFont));
                document.add(new Paragraph("Fahasalamana: " + info.getFahasalamana(), normalFont));
                document.add(new Paragraph("Isa mpilasy: " + info.getIsaMpilasy(), normalFont));
                document.add(new Paragraph("Toerana hiaingana: " + info.getToeranaHiaingana(), normalFont));
                document.add(new Paragraph("Toerana hiverenana: " + info.getToeranaHiverenana(), normalFont));
            } else {
                document.add(new Paragraph("Aucune information de camp enregistrée.", normalFont));
            }
            document.add(new Paragraph(" "));
            document.add(new Paragraph("Activités", headingFont));
            PdfPTable table = new PdfPTable(5);
            table.setWidthPercentage(100);
            table.setWidths(new float[] { 30, 12, 12, 12, 12 });
            String[] headers = { "Antony", "Quantité", "Prix unitaire", "Montant", "Type mouvement" };
            for (String header : headers) {
                PdfPCell cell = new PdfPCell(new Phrase(header, headingFont));
                cell.setPadding(5);
                table.addCell(cell);
            }
            BigDecimal totalEntree = BigDecimal.ZERO;
            BigDecimal totalSortie = BigDecimal.ZERO;
            for (ActiviteCamp act : activites) {
                table.addCell(new PdfPCell(new Phrase(act.getAntony() != null ? act.getAntony() : "", normalFont)));
                table.addCell(new PdfPCell(
                        new Phrase(act.getQuantite() != null ? act.getQuantite().toString() : "", normalFont)));
                table.addCell(new PdfPCell(
                        new Phrase(act.getPrixUnitaire() != null ? act.getPrixUnitaire().toString() : "", normalFont)));
                table.addCell(new PdfPCell(
                        new Phrase(act.getMontant() != null ? act.getMontant().toString() : "", normalFont)));
                table.addCell(new PdfPCell(
                        new Phrase(act.getTypeMouvement() != null ? act.getTypeMouvement() : "", normalFont)));
                if ("entree".equalsIgnoreCase(act.getTypeMouvement()) && act.getMontant() != null) {
                    totalEntree = totalEntree.add(act.getMontant());
                }
                if ("sortie".equalsIgnoreCase(act.getTypeMouvement()) && act.getMontant() != null) {
                    totalSortie = totalSortie.add(act.getMontant());
                }
            }
            document.add(table);
            document.add(new Paragraph(" "));
            document.add(new Paragraph("Total entrée: " + totalEntree, normalFont));
            document.add(new Paragraph("Total sortie: " + totalSortie, normalFont));
        } catch (DocumentException e) {
            throw new IOException("Erreur création PDF", e);
        } finally {
            document.close();
        }
    }

    private BigDecimal parseDecimal(String value) {
        if (value == null || value.isBlank()) {
            return null;
        }
        try {
            return new BigDecimal(value);
        } catch (NumberFormatException e) {
            return null;
        }
    }

    private BigDecimal resolveMontant(String montant, BigDecimal quantite, BigDecimal prixUnitaire) {
        BigDecimal parsed = parseDecimal(montant);
        if (parsed != null) {
            return parsed;
        }
        if (quantite != null && prixUnitaire != null) {
            return quantite.multiply(prixUnitaire);
        }
        return null;
    }
}
