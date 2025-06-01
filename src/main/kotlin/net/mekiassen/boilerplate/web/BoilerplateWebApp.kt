package net.mekiassen.boilerplate.web

import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication

@SpringBootApplication
class BoilerplateWebApp

fun main(args: Array<String>) {
	runApplication<BoilerplateWebApp>(*args)
}
