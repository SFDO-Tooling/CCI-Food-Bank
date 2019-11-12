from cumulusci.robotframework.pageobjects import NewModal
from cumulusci.robotframework.pageobjects import pageobject


@pageobject("New", "Delivery Item")
class DeliveryNewModal(NewModal):
    def populate_picklist(self, name, value):
        locator_picklist = (
            "//div[contains(@class, 'uiInput')]"
            "[.//span[contains(@class, 'uiPicklistLabel')]"
            "[.//span[text()='{}']]]//div"
        ).format(name)
        locator_value = (
            "//div[contains(@class, 'uiMenuList') and contains(@class, 'visible')]"
            "//div//ul//li//a[text()='{}']"
        ).format(value)
        self.selenium.set_focus_to_element(locator_picklist)
        picklist = self.selenium.get_webelement(locator_picklist)
        picklist.click()

        self.selenium.set_focus_to_element(locator_value)
        picklist_value = self.selenium.get_webelement(locator_value)
        picklist_value.click()
