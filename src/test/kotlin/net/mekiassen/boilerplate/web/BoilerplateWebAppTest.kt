package net.mekiassen.boilerplate.web

import org.junit.jupiter.api.Test
import org.springframework.boot.test.context.SpringBootTest
import org.springframework.boot.test.context.SpringBootTest.WebEnvironment
import org.springframework.boot.test.web.server.LocalServerPort

@SpringBootTest(webEnvironment = WebEnvironment.RANDOM_PORT)
class BoilerplateWebAppTest(
    @LocalServerPort private val port: Int,
) {

    @Test
    fun `Context loads and app is healthy`() {
    }
}