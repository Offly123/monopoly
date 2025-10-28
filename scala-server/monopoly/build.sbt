val scala3Version = "3.7.3"

lazy val root = project
  .in(file("."))
  .settings(
    name := "monopoly",
    version := "0.1.0-SNAPSHOT",

    scalaVersion := scala3Version,

    libraryDependencies += "org.scalameta" %% "munit" % "1.0.0" % Test
  )

libraryDependencies ++= Seq(
  "org.http4s" %% "http4s-ember-server" % "0.23.24",
  "org.http4s" %% "http4s-dsl"          % "0.23.24",
  "org.http4s" %% "http4s-circe"        % "0.23.24",
  "io.circe"   %% "circe-generic"       % "0.14.6"
)