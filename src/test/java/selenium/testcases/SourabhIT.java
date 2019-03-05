package selenium.testcases;



import org.openqa.selenium.WebDriver;
import org.openqa.selenium.remote.DesiredCapabilities;
import org.openqa.selenium.remote.RemoteWebDriver;


public class SourabhIT {

	@Test
	public void checkGoogle() {
		WebDriver webDriver = new RemoteWebDriver(DesiredCapabilities.firefox());
		webDriver.get("http://www.google.com");
		webDriver.getTitle();
		String expectedTitle = "Google";
		String actualTitle = null;
		actualTitle = webDriver.getTitle();
		//Assert.assertTrue(actualTitle.contains(expectedTitle));
		if(expectedTitle == actualTitle){
			System.out.println("Test completed--- Selenium");
		}
		webDriver.quit();
		System.out.println("Test completed--- Selenium");
	}
}
