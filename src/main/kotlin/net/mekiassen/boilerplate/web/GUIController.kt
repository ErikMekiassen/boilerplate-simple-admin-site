package net.mekiassen.boilerplate.web

import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RestController
import org.springframework.web.servlet.ModelAndView

@RestController
class GUIController {

    @GetMapping("/")
    fun getHovedside(): ModelAndView {
        return ModelAndView("index")
    }

}
