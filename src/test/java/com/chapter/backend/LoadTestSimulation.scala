package com.chapter.backend

import com.intuit.karate.gatling.PreDef._
import io.gatling.core.Predef._
import io.gatling.core.structure.ScenarioBuilder

import scala.util.Properties

class LoadTestSimulation extends Simulation {

  before {
    println("Chapter Backend Load Tests are about to start!!")
  }

  val rampUsersCount: Int = Properties.propOrElse("rampUpUsers", "20").toInt
  val rampDuration: Int = Properties.propOrElse("DrampUpDuration", "5").toInt

  val chapterBackendTest: ScenarioBuilder =
    scenario("Chapter Backend Simulation")
    .exec(
      karateFeature("classpath:features/crud.feature")
    )

  setUp(
    chapterBackendTest.inject(rampUsers(rampUsersCount) during rampDuration)
  )

  after {
    println("Chapter Backend Load Tests finished!!")
  }
}