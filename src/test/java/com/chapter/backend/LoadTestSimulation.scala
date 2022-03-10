package com.chapter.backend

import com.intuit.karate.gatling.PreDef._
import io.gatling.core.Predef._
import io.gatling.core.structure.ScenarioBuilder

import scala.util.Properties

class LoadTestSimulation extends Simulation {

  before {
    println("Chapter Backend Load Tests are about to start!!")
  }

  val rampUsersCount: Int = Properties.propOrElse("rampUsers", "20").toInt
  val rampDuration: Int = Properties.propOrElse("rampDuration", "5").toInt

  val tasklistManagementTest: ScenarioBuilder = scenario("Chapter Backend Simulation")
    .exec(
      karateFeature("classpath:features/crud.feature")
    )

  setUp(
    tasklistManagementTest.inject(rampUsers(rampUsersCount) during rampDuration)
  )

  after {
    println("Chapter Backend Load Tests finished!!")
  }

}