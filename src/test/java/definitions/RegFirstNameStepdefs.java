package definitions;

import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import org.apache.commons.lang3.RandomStringUtils;
import org.openqa.selenium.By;
import static org.assertj.core.api.Assertions.assertThat;

import static support.TestContext.getDriver;

public class RegFirstNameStepdefs {
    @When("I type {int} characters into firstname filed")
    public void iTypeCharactersIntoFirstnameFiled(int charact) {
        String randomString = RandomStringUtils.randomAlphanumeric(charact);
        getDriver().findElement(By.xpath("//input[@formcontrolname='firstName']")).sendKeys(randomString);
    }

    @Then("error message in pop-up window  should be displayed")
    public void errorMessageInPopUpWindowShouldBeDisplayed() {
        getDriver().findElement(By.xpath("//simple-snack-bar")).isDisplayed();
    }

    @Then("error message {string} in pop-up window  should be displayed")
    public void errorMessageInPopUpWindowShouldBeDisplayed(String expMess) {
        String actMess = getDriver().findElement(By.xpath("//simple-snack-bar")).getText();
        System.out.println(actMess);
        assertThat(actMess.contains(expMess)).isTrue();
    }
}

