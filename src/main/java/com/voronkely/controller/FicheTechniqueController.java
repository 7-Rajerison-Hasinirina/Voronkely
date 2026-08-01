package com.voronkely.controller;

import com.voronkely.entity.ActiviteFicheTechnique;
import com.voronkely.entity.FicheTechnique;
import com.voronkely.entity.FicheTechniqueInfo;
import com.voronkely.service.FicheTechniqueInfoService;
import com.voronkely.service.FicheTechniqueService;
import com.voronkely.repository.ActiviteFicheTechniqueRepository;
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
import jakarta.servlet.http.HttpServletResponse;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/fiche-technique")
public class FicheTechniqueController {

    private final FicheTechniqueService ficheService;
    private final FicheTechniqueInfoService infoService;
    private final ActiviteFicheTechniqueRepository activiteRepo;
    private final com.voronkely.service.NumeroTrimestreService numeroTrimestreService;

    public FicheTechniqueController(FicheTechniqueService ficheService, FicheTechniqueInfoService infoService,
            ActiviteFicheTechniqueRepository activiteRepo,
            com.voronkely.service.NumeroTrimestreService numeroTrimestreService) {
        this.ficheService = ficheService;
        this.infoService = infoService;
        this.activiteRepo = activiteRepo;
        this.numeroTrimestreService = numeroTrimestreService;
    }

    @GetMapping
    public String pageFicheTechnique(Model model) {
        model.addAttribute("fiches", ficheService.findAll());
        return "fiche-technique/page-fiche-technique";
    }

    @GetMapping("/nouveau")
    public String nouveau(Model model) {
        FicheTechnique f = new FicheTechnique();
        model.addAttribute("ficheTechnique", f);
        model.addAttribute("numeroTrimestres", numeroTrimestreService.findAll());
        return "fiche-technique/fiche-technique-form";
    }

    @PostMapping
    public String enregistrer(@ModelAttribute FicheTechnique fiche) {
        if (fiche.getNumeroTrimestre() != null && fiche.getNumeroTrimestre().getId() != null) {
            var opt = numeroTrimestreService.findById(fiche.getNumeroTrimestre().getId());
            opt.ifPresent(fiche::setNumeroTrimestre);
        }

        ficheService.save(fiche);
        return "redirect:/fiche-technique";
    }

    @GetMapping("/{id}")
    public String gestionInfo(@PathVariable Long id, Model model) {
        var opt = ficheService.findById(id);
        if (opt.isEmpty())
            return "redirect:/fiche-technique";

        FicheTechnique fiche = opt.get();
        model.addAttribute("fiche", fiche);

        var infoOpt = infoService.findByFicheTechniqueId(id);
        model.addAttribute("info", infoOpt.orElse(null));

        List<ActiviteFicheTechnique> activites = activiteRepo.findByFicheTechniqueId(id);
        if (activites == null)
            activites = new ArrayList<>();
        model.addAttribute("activites", activites);

        return "fiche-technique/gestion-fiche-technique-info";
    }

    @GetMapping("/{id}/activites")
    public String listeActivites(@PathVariable Long id, Model model) {
        var opt = ficheService.findById(id);
        if (opt.isEmpty())
            return "redirect:/fiche-technique";

        FicheTechnique fiche = opt.get();
        model.addAttribute("fiche", fiche);

        List<ActiviteFicheTechnique> activites = activiteRepo.findByFicheTechniqueId(id);
        if (activites == null)
            activites = new ArrayList<>();
        model.addAttribute("activites", activites);

        return "fiche-technique/activite-fiche-technique";
    }

    @GetMapping("/{id}/activites/export/excel")
    public void exportActivitesExcel(@PathVariable Long id, HttpServletResponse response) throws IOException {
        var opt = ficheService.findById(id);
        if (opt.isEmpty()) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
            return;
        }

        List<ActiviteFicheTechnique> activites = activiteRepo.findByFicheTechniqueId(id);
        try (Workbook workbook = new XSSFWorkbook()) {
            Sheet sheet = workbook.createSheet("Activités");
            Row header = sheet.createRow(0);
            String[] headerValues = { "Daty", "Lohahevitra", "Fomba fampitana", "Sahanasa", "Tomponandraikitra",
                    "Fanamarihana" };
            for (int i = 0; i < headerValues.length; i++) {
                header.createCell(i).setCellValue(headerValues[i]);
            }

            for (int i = 0; i < activites.size(); i++) {
                ActiviteFicheTechnique act = activites.get(i);
                Row row = sheet.createRow(i + 1);
                row.createCell(0).setCellValue(act.getDaty() != null ? act.getDaty().toString() : "");
                row.createCell(1).setCellValue(act.getLohahevitra() != null ? act.getLohahevitra() : "");
                row.createCell(2).setCellValue(act.getFombaFampiasa() != null ? act.getFombaFampiasa() : "");
                row.createCell(3).setCellValue(act.getSahanasa() != null ? act.getSahanasa() : "");
                row.createCell(4).setCellValue(act.getTomponandraikitra() != null ? act.getTomponandraikitra() : "");
                row.createCell(5).setCellValue(act.getFanamarihana() != null ? act.getFanamarihana() : "");
            }

            for (int i = 0; i < headerValues.length; i++) {
                sheet.autoSizeColumn(i);
            }

            String fileName = "activites_fiche_" + id + ".xlsx";
            response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
            response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\"");
            workbook.write(response.getOutputStream());
        }
    }

    @GetMapping("/{id}/export/pdf")
    public void exportFicheTechniquePdf(@PathVariable Long id, HttpServletResponse response) throws IOException {
        var opt = ficheService.findById(id);
        if (opt.isEmpty()) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
            return;
        }

        FicheTechnique fiche = opt.get();
        var infoOpt = infoService.findByFicheTechniqueId(id);
        List<ActiviteFicheTechnique> activites = activiteRepo.findByFicheTechniqueId(id);

        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "attachment; filename=\"fiche_technique_" + id + ".pdf\"");

        Document document = new Document(PageSize.A4.rotate());
        try {
            PdfWriter.getInstance(document, response.getOutputStream());
            document.open();

            Font titleFont = FontFactory.getFont(FontFactory.HELVETICA_BOLD, 16);
            Font headingFont = FontFactory.getFont(FontFactory.HELVETICA_BOLD, 12);
            Font normalFont = FontFactory.getFont(FontFactory.HELVETICA, 10);

            document.add(new Paragraph("Fiche Technique: " + fiche.getTitre(), titleFont));
            document.add(new Paragraph("Année : " + fiche.getAnnee(), normalFont));
            document.add(new Paragraph(" "));

            document.add(new Paragraph("Informations de fiche", headingFont));
            var info = infoOpt.orElse(null);
            if (info != null) {
                document.add(new Paragraph("Faritra: " + info.getFaritra(), normalFont));
                document.add(new Paragraph("Tenin Andriamanitra: " + info.getTeninAndriamanitra(), normalFont));
                document.add(new Paragraph("Tarigetra: " + info.getTarigetra(), normalFont));
                document.add(new Paragraph("Toerana ivoriana: " + info.getToeranaIvoriana(), normalFont));
                document.add(new Paragraph("Andro ivoriana: " + info.getAndroIvoriana(), normalFont));
                document.add(new Paragraph("Ora ivoriana: " + info.getOraIvoriana(), normalFont));
                document.add(new Paragraph("Ny tonia: " + info.getNyTonia(), normalFont));
                document.add(new Paragraph("Komitim pivondronana: " + info.getKomitimPivondronana(), normalFont));
                document.add(new Paragraph("Filoha: " + info.getFiloha(), normalFont));
                document.add(new Paragraph("Daty iraisana: " + info.getDatyIraisana(), normalFont));
                document.add(new Paragraph("Objectif: " + info.getObjectif(), normalFont));
                document.add(new Paragraph("Tomponandraikitra: " + info.getTomponAndraikitra(), normalFont));
            } else {
                document.add(new Paragraph("Aucune information enregistrée.", normalFont));
            }

            document.add(new Paragraph(" "));
            document.add(new Paragraph("Activités", headingFont));

            PdfPTable pdfTable = new PdfPTable(6);
            pdfTable.setWidthPercentage(100);
            pdfTable.setWidths(new float[] { 10, 20, 25, 20, 20, 25 });

            String[] headers = { "Daty", "Lohahevitra", "Fomba fampitana", "Sahanasa", "Tomponandraikitra",
                    "Fanamarihana" };
            for (String headerValue : headers) {
                PdfPCell cell = new PdfPCell(new Phrase(headerValue, headingFont));
                cell.setPadding(5);
                pdfTable.addCell(cell);
            }

            for (ActiviteFicheTechnique act : activites) {
                pdfTable.addCell(
                        new PdfPCell(new Phrase(act.getDaty() != null ? act.getDaty().toString() : "", normalFont)));
                pdfTable.addCell(
                        new PdfPCell(new Phrase(act.getLohahevitra() != null ? act.getLohahevitra() : "", normalFont)));
                pdfTable.addCell(new PdfPCell(
                        new Phrase(act.getFombaFampiasa() != null ? act.getFombaFampiasa() : "", normalFont)));
                pdfTable.addCell(
                        new PdfPCell(new Phrase(act.getSahanasa() != null ? act.getSahanasa() : "", normalFont)));
                pdfTable.addCell(new PdfPCell(
                        new Phrase(act.getTomponandraikitra() != null ? act.getTomponandraikitra() : "", normalFont)));
                pdfTable.addCell(new PdfPCell(
                        new Phrase(act.getFanamarihana() != null ? act.getFanamarihana() : "", normalFont)));
            }

            document.add(pdfTable);
        } catch (DocumentException e) {
            throw new IOException("Erreur création PDF", e);
        } finally {
            document.close();
        }
    }

    @GetMapping("/{id}/activites/nouveau")
    public String nouveauActivite(@PathVariable Long id, Model model) {
        var opt = ficheService.findById(id);
        if (opt.isEmpty())
            return "redirect:/fiche-technique";

        model.addAttribute("ficheId", id);
        model.addAttribute("activite", new ActiviteFicheTechnique());
        return "fiche-technique/activite-fiche-technique-form";
    }

    @GetMapping("/{id}/activites/{activiteId}/edit")
    public String editActivite(@PathVariable Long id, @PathVariable Long activiteId, Model model) {
        var ficheOpt = ficheService.findById(id);
        if (ficheOpt.isEmpty())
            return "redirect:/fiche-technique";

        ActiviteFicheTechnique activite = activiteRepo.findById(activiteId).orElse(null);
        if (activite == null || activite.getFicheTechnique() == null
                || !activite.getFicheTechnique().getId().equals(id)) {
            return "redirect:/fiche-technique/" + id + "/activites";
        }

        model.addAttribute("ficheId", id);
        model.addAttribute("activite", activite);
        return "fiche-technique/activite-fiche-technique-form";
    }

    @PostMapping("/{id}/activites/{activiteId}/edit")
    public String saveActiviteEdit(@PathVariable Long id, @PathVariable Long activiteId,
            @RequestParam(required = false) String daty,
            @RequestParam(required = false) String lohahevitra,
            @RequestParam(required = false) String fombaFampiasa,
            @RequestParam(required = false) String sahanasa,
            @RequestParam(required = false) String tomponandraikitra,
            @RequestParam(required = false) String fanamarihana) {
        var ficheOpt = ficheService.findById(id);
        if (ficheOpt.isEmpty())
            return "redirect:/fiche-technique";

        ActiviteFicheTechnique activite = activiteRepo.findById(activiteId).orElse(null);
        if (activite == null || activite.getFicheTechnique() == null
                || !activite.getFicheTechnique().getId().equals(id)) {
            return "redirect:/fiche-technique/" + id + "/activites";
        }

        if (daty != null && !daty.isBlank()) {
            activite.setDaty(LocalDate.parse(daty));
        } else {
            activite.setDaty(null);
        }
        activite.setLohahevitra(lohahevitra);
        activite.setFombaFampiasa(fombaFampiasa);
        activite.setSahanasa(sahanasa);
        activite.setTomponandraikitra(tomponandraikitra);
        activite.setFanamarihana(fanamarihana);
        activiteRepo.save(activite);

        return "redirect:/fiche-technique/" + id + "/activites";
    }

    @GetMapping("/{id}/activites/{activiteId}/supprimer")
    public String supprimerActivite(@PathVariable Long id, @PathVariable Long activiteId) {
        var activiteOpt = activiteRepo.findById(activiteId);
        if (activiteOpt.isPresent()) {
            ActiviteFicheTechnique activite = activiteOpt.get();
            if (activite.getFicheTechnique() != null && activite.getFicheTechnique().getId().equals(id)) {
                activiteRepo.deleteById(activiteId);
            }
        }
        return "redirect:/fiche-technique/" + id + "/activites";
    }

    @PostMapping("/{id}/activites")
    public String saveActivite(@PathVariable Long id,
            @RequestParam(required = false) List<String> daty,
            @RequestParam(required = false) List<String> lohahevitra,
            @RequestParam(required = false) List<String> fombaFampiasa,
            @RequestParam(required = false) List<String> sahanasa,
            @RequestParam(required = false) List<String> tomponandraikitra,
            @RequestParam(required = false) List<String> fanamarihana) {
        var opt = ficheService.findById(id);
        if (opt.isEmpty())
            return "redirect:/fiche-technique";

        List<String> datyList = daty == null ? new ArrayList<>() : daty;
        List<String> lohaList = lohahevitra == null ? new ArrayList<>() : lohahevitra;
        List<String> fombaList = fombaFampiasa == null ? new ArrayList<>() : fombaFampiasa;
        List<String> sahanasaList = sahanasa == null ? new ArrayList<>() : sahanasa;
        List<String> tomponList = tomponandraikitra == null ? new ArrayList<>() : tomponandraikitra;
        List<String> fanamarihanaList = fanamarihana == null ? new ArrayList<>() : fanamarihana;

        int rows = Math.max(datyList.size(), Math.max(lohaList.size(), Math.max(fombaList.size(),
                Math.max(sahanasaList.size(), Math.max(tomponList.size(), fanamarihanaList.size())))));
        for (int i = 0; i < rows; i++) {
            String datyValue = i < datyList.size() ? datyList.get(i) : null;
            String lohaValue = i < lohaList.size() ? lohaList.get(i) : null;
            String fombaValue = i < fombaList.size() ? fombaList.get(i) : null;
            String sahanasaValue = i < sahanasaList.size() ? sahanasaList.get(i) : null;
            String tomponValue = i < tomponList.size() ? tomponList.get(i) : null;
            String fanamarihanaValue = i < fanamarihanaList.size() ? fanamarihanaList.get(i) : null;

            boolean hasData = (datyValue != null && !datyValue.isBlank())
                    || (lohaValue != null && !lohaValue.isBlank())
                    || (fombaValue != null && !fombaValue.isBlank())
                    || (sahanasaValue != null && !sahanasaValue.isBlank())
                    || (tomponValue != null && !tomponValue.isBlank())
                    || (fanamarihanaValue != null && !fanamarihanaValue.isBlank());
            if (!hasData) {
                continue;
            }

            ActiviteFicheTechnique activite = new ActiviteFicheTechnique();
            activite.setFicheTechnique(opt.get());
            if (datyValue != null && !datyValue.isBlank()) {
                activite.setDaty(LocalDate.parse(datyValue));
            }
            activite.setLohahevitra(lohaValue);
            activite.setFombaFampiasa(fombaValue);
            activite.setSahanasa(sahanasaValue);
            activite.setTomponandraikitra(tomponValue);
            activite.setFanamarihana(fanamarihanaValue);
            activiteRepo.save(activite);
        }

        return "redirect:/fiche-technique/" + id + "/activites";
    }

    @GetMapping("/{id}/info/nouveau")
    public String nouveauInfo(@PathVariable Long id, Model model) {
        var opt = ficheService.findById(id);
        if (opt.isEmpty())
            return "redirect:/fiche-technique";

        model.addAttribute("ficheId", id);
        infoService.findByFicheTechniqueId(id).ifPresent(info -> model.addAttribute("info", info));
        return "fiche-technique/fiche-technique-info-form";
    }

    @PostMapping("/{id}/info")
    public String saveInfo(@PathVariable Long id, @RequestParam String faritra,
            @RequestParam(required = false) String teninAndriamanitra,
            @RequestParam(required = false) String tarigetra,
            @RequestParam(required = false) String toeranaIvoriana,
            @RequestParam(required = false) String androIvoriana,
            @RequestParam(required = false) String oraIvoriana,
            @RequestParam(required = false) String nyTonia,
            @RequestParam(required = false) String komitimPivondronana,
            @RequestParam(required = false) String filoha,
            @RequestParam(required = false) String datyIraisana,
            @RequestParam(required = false) String objectif,
            @RequestParam(required = false) String tomponAndraikitra) {
        var opt = ficheService.findById(id);
        if (opt.isEmpty())
            return "redirect:/fiche-technique";

        FicheTechniqueInfo info = infoService.findByFicheTechniqueId(id).orElse(new FicheTechniqueInfo());
        info.setFicheTechnique(opt.get());
        info.setFaritra(faritra);
        info.setTeninAndriamanitra(teninAndriamanitra);
        info.setTarigetra(tarigetra);
        info.setToeranaIvoriana(toeranaIvoriana);
        info.setAndroIvoriana(androIvoriana);
        info.setOraIvoriana(oraIvoriana);
        info.setNyTonia(nyTonia);
        info.setKomitimPivondronana(komitimPivondronana);
        info.setFiloha(filoha);
        info.setDatyIraisana(datyIraisana);
        info.setObjectif(objectif);
        info.setTomponAndraikitra(tomponAndraikitra);

        infoService.save(info);

        return "redirect:/fiche-technique/" + id;
    }

}
