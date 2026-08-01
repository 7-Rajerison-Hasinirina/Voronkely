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
import com.voronkely.entity.Agenda;
import com.voronkely.service.AgendaService;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.time.LocalDate;
import java.util.List;

@Controller
@RequestMapping("/agenda")
public class AgendaController {

    private final AgendaService agendaService;

    public AgendaController(AgendaService agendaService) {
        this.agendaService = agendaService;
    }

    @GetMapping
    public String pageAgenda(@RequestParam(required = false) String dateMin,
            @RequestParam(required = false) String dateMax,
            Model model) {
        List<Agenda> agendas;
        if (dateMin != null && !dateMin.isBlank() && dateMax != null && !dateMax.isBlank()) {
            LocalDate start = LocalDate.parse(dateMin);
            LocalDate end = LocalDate.parse(dateMax);
            agendas = agendaService.findByDateRange(start, end);
        } else {
            agendas = agendaService.findAllByDateDesc();
        }
        model.addAttribute("agendas", agendas);
        model.addAttribute("dateMin", dateMin);
        model.addAttribute("dateMax", dateMax);
        model.addAttribute("today", LocalDate.now());
        return "agenda/page-agenda";
    }

    @GetMapping("/nouveau")
    public String nouveauAgenda(Model model) {
        model.addAttribute("agenda", new Agenda());
        return "agenda/agenda-form";
    }

    @PostMapping
    public String enregistrerAgenda(@ModelAttribute Agenda agenda) {
        agenda.setDateCreation(LocalDate.now());
        agendaService.save(agenda);
        return "redirect:/agenda";
    }

    @GetMapping("/{id}/supprimer")
    public String supprimerAgenda(@PathVariable Long id) {
        agendaService.deleteById(id);
        return "redirect:/agenda";
    }

    @GetMapping("/export/pdf")
    public void exportAgendaPdf(@RequestParam(required = false) String dateMin,
            @RequestParam(required = false) String dateMax,
            HttpServletResponse response) throws IOException {
        List<Agenda> agendas;
        if (dateMin != null && !dateMin.isBlank() && dateMax != null && !dateMax.isBlank()) {
            LocalDate start = LocalDate.parse(dateMin);
            LocalDate end = LocalDate.parse(dateMax);
            agendas = agendaService.findByDateRange(start, end);
        } else {
            agendas = agendaService.findAllByDateDesc();
        }

        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "attachment; filename=agenda.pdf");

        Document document = new Document(PageSize.A4.rotate());
        try {
            PdfWriter.getInstance(document, response.getOutputStream());
            document.open();
            Font titleFont = FontFactory.getFont(FontFactory.HELVETICA_BOLD, 16);
            Font headingFont = FontFactory.getFont(FontFactory.HELVETICA_BOLD, 12);
            Font normalFont = FontFactory.getFont(FontFactory.HELVETICA, 10);
            document.add(new Paragraph("Agenda", titleFont));
            document.add(new Paragraph(" "));

            if (dateMin != null && !dateMin.isBlank() && dateMax != null && !dateMax.isBlank()) {
                document.add(new Paragraph("Filtre : " + dateMin + " à " + dateMax, normalFont));
                document.add(new Paragraph(" "));
            }

            PdfPTable table = new PdfPTable(4);
            table.setWidthPercentage(100);
            table.setWidths(new float[] { 25, 20, 20, 35 });

            String[] headerValues = { "Titre", "Date création", "Date utilisation", "Contenu" };
            for (String header : headerValues) {
                PdfPCell cell = new PdfPCell(new Phrase(header, headingFont));
                cell.setPadding(5);
                table.addCell(cell);
            }

            for (Agenda agenda : agendas) {
                table.addCell(new PdfPCell(new Phrase(agenda.getTitre(), normalFont)));
                table.addCell(new PdfPCell(new Phrase(
                        agenda.getDateCreation() != null ? agenda.getDateCreation().toString() : "", normalFont)));
                table.addCell(new PdfPCell(
                        new Phrase(agenda.getDateUtilisation() != null ? agenda.getDateUtilisation().toString() : "",
                                normalFont)));
                table.addCell(
                        new PdfPCell(new Phrase(agenda.getContenu() != null ? agenda.getContenu() : "", normalFont)));
            }

            document.add(table);
        } catch (DocumentException e) {
            throw new IOException("Erreur lors de la création du PDF", e);
        } finally {
            document.close();
        }
    }
}
