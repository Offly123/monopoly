import cats.effect.*
import com.comcast.ip4s.*
import org.http4s.*
import org.http4s.dsl.io.*
import org.http4s.ember.server.EmberServerBuilder
import org.http4s.implicits.*
import cats.effect.unsafe.implicits.global

@main
def runServer(): Unit =
  println("Starting monopoly server...")
  
  val routes = HttpRoutes.of[IO] {
    case GET -> Root => IO(Response[IO](body = fs2.Stream.emits("Monopoly!\n".getBytes)))
    case GET -> Root / "test" => IO(Response[IO](body = fs2.Stream.emits("Test OK\n".getBytes)))
  }

  EmberServerBuilder
    .default[IO]
    .withHost(ipv4"0.0.0.0")
    .withPort(port"8081")
    .withHttpApp(routes.orNotFound)
    .build
    .use(_ => IO.never)
    .unsafeRunSync()