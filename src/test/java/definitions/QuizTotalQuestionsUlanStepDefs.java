package definitions;

import io.cucumber.java.en.*;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;

import java.util.List;

import static org.assertj.core.api.Assertions.assertThat;
import static support.TestContext.getDriver;


import io.cucumber.java.en.And;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;

import java.util.List;

import static support.TestContext.getDriver;
import static org.assertj.core.api.Assertions.assertThat;

public class QuizTotalQuestionsUlanStepDefs {
    @When("I click {string} button of the ASK page")
    public void iClickButtonOfTheASKPage(String btnName) {
        getDriver().findElement(By.xpath("//span[contains(text(),'" + btnName + "')]")).click();
    }

    @Then("current url should contain {string} of the ASK page")
    public void currentUrlShouldContainOfTheASKPage(String expUrl) {
        String curUrl = getDriver().getCurrentUrl();
        assertThat(curUrl.contains(expUrl)).isTrue();
    }

    @Then("user role should be {string} of the ASK page")
    public void userRoleShouldBeOfTheASKPage(String role) {
        String actRole = getDriver().findElement(By.xpath("//div[@class='info']")).getText();
        assertThat(actRole.contains(role)).isTrue();
    }

    @When("I click {string} menu item of the ASK page")
    public void iClickMenuItemOfTheASKPage(String menuItem) {
        getDriver().findElement(By.xpath("//h5[contains(text(), '" + menuItem + "')]")).click();
    }

    @And("I type {string} as quiz title of the ASK page")
    public void iTypeAsQuizTitleOfTheASKPage(String quizTitle) {
        getDriver().findElement(By.xpath("//input[@formcontrolname='name']")).sendKeys(quizTitle);
    }

    @When("I add a question of the ASK page")
    public void iAddAQuestionOfTheASKPage() {
        getDriver().findElement(By.xpath("//*[contains(text(), 'add_circle')]")).click();
    }

    @When("I select {string} in {string} of the ASK page")
    public void iSelectInOfTheASKPage(String qType, String qNum) {
        getDriver().findElement(By.xpath("//mat-panel-title[contains(text(),'" + qNum + "')]/../../..//*[contains(text(), '" + qType + "')]")).click();
    }

    @And("I type {string} into question field of {string} of the ASK page")
    public void iTypeIntoQuestionFieldOfOfTheASKPage(String qText, String qNum) {
        getDriver().findElement(By.xpath("//mat-panel-title[contains(text(),'" + qNum + "')]/../../..//*[@formcontrolname='question']")).sendKeys(qText);
    }

    @When("I type {string} into {string} field of {string} of the ASK page")
    public void iTypeIntoFieldOfOfTheASKPage(String oText, String oNum, String qNum) {
        getDriver().findElement(By.xpath("//mat-panel-title[contains(text(),'" + qNum + "')]/../../..//*[@placeholder = '" + oNum + "']")).sendKeys(oText);
    }

    @And("I select {string} as a correct option in {string} of the ASK page")
    public void iSelectAsACorrectOptionInOfTheASKPage(String oNum, String qNum) {
        getDriver().findElement(By.xpath("//mat-panel-title[contains(text(),'" + qNum + "')]/../../../..//*[@placeholder='" + oNum + "']/../../../../../mat-radio-button")).click();

    }

    @Then("{string} should be displayed on the list of quizzes of the ASK page")
    public void shouldBeDisplayedOnTheListOfQuizzesOfTheASKPage(String quizTitle) {
        List<WebElement> titles = getDriver().findElements(By.xpath("//mat-panel-title"));
        for (WebElement title : titles) {
            if (title.getText().contains(quizTitle)) {
                assertThat(title.isDisplayed()).isTrue();
            }

        }

    }

    @And("I delete {string} from the list of quizzes of the ASK page")
    public void iDeleteFromTheListOfQuizzesOfTheASKPage(String quizTitle) {
        getDriver().findElement(By.xpath("//mat-panel-title[contains(text(),'" + quizTitle + "')]")).click();
        getDriver().findElement(By.xpath("//mat-panel-title[contains(text(),'" + quizTitle + "')]/../../..//*[contains(text(),'Delete')]")).click();
        getDriver().findElement(By.xpath("//ac-modal-confirmation/..//*[text()='Delete']")).click();

    }

    @When("I add {int} Textual questions of the ASK page")
    public void iAddTextualQuestionsOfTheASKPage(int num) throws InterruptedException {
        for (int i = 1; i <= num; i++) {
            getDriver().findElement(By.xpath("//*[contains(text(), 'add_circle')]")).click();
            Thread.sleep(1000);
            getDriver().findElement(By.xpath("//*[contains(text(),'Q" + i + "')]/../../..//*[contains(text(),'Textual')]")).click();
            String xpath = "//*[contains(text(),'Q" + i + "')]/../../..//*[@formcontrolname='question']";
            getDriver().findElement(By.xpath(xpath)).sendKeys("Question " + i);

        }
    }

    @Given("I open {string} page of The ASK page US")
    public void iOpenPageOfTheASKPageUS(String url) {
        if (url.contains("registration")) {
            getDriver().get("http://ask-qa.portnov.com/#/registration");
        } else if (url.contains("login")) {
            getDriver().get("http://ask-qa.portnov.com/#/login");
        } else {
            System.out.println("This website is not supported " + url);
        }
    }


//    @Then("element {string} should be displayed on the list of quizzes of the ASK page")
//    public void shouldBeDisplayedOnTheListOfQuizzesOfTheASKPage(String quizTitle, String text) {
//        String actualText = getDriver().findElement(By.xpath("//mat-panel-description/./.." + quizTitle + "')]")).getText();
//        assertThat(actualText).containsIgnoringCase(text);
//            }


}









//    @Then("{int} questions of the TA Quiz Demo should be displayed on the list of quizzes")
//    public void questionsOfTheTAQuizDemoShouldBeDisplayedOnTheListOfQuizzes(int num) {
//        for (int i = 1; i = num;){
//
//        }


//    @When("I add {int} Textual questionsUs")
//    public void iAddTextualQuestionsUs(int num) throws InterruptedException {
//        for (int i =1; i <=num ; i++) {
//            getDriver().findElement(By.xpath("//*[contains(text(), 'add_circle')]")).click();
//            Thread.sleep(1000);
//            getDriver().findElement(By.xpath("//*[contains(text(),'Q" + i + "')]/../../..//*[contains(text(),'Textual')]")).click();
//            String xpath = "//*[contains(text(),'Q" + i+"')]/../../..//*[@formcontrolname='question']";
//            getDriver().findElement(By.xpath(xpath)).sendKeys("Question " + i);





