package net.mekiassen.boilerplate.web.controller

import org.springframework.web.bind.annotation.PostMapping
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RestController
import org.springframework.web.servlet.ModelAndView
import java.time.LocalDateTime
import java.time.ZoneId
import java.time.ZonedDateTime


@RestController
@RequestMapping("/api/admin")
class Controller(
    private val number: Int = 0
)

@PostMapping
fun LeggTilEn(
): ModelAndView {

    return try {
        ModelAndView("components/brev/respons/OkRespons")
    } catch (e: Exception) {
        ModelAndView("components/brev/respons/ErrorRespons").apply { addObject("errorMessage", "Feil i dataen: ${e.message}") }
    }
}