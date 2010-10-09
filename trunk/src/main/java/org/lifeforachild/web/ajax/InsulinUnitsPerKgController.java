package org.lifeforachild.web.ajax;

import org.lifeforachild.Util.DecimalUtil;
import org.lifeforachild.domain.ClinicalRecord;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@RequestMapping("/ajax/insulinUnitsPerKg/*/*")
@Controller
public class InsulinUnitsPerKgController
{
    @RequestMapping("/ajax/insulinUnitsPerKg/{weightKG}/{insulinUnitsPerDay}")
    public @ResponseBody String calculateInsulinUnitsPerKg(@PathVariable String weightKG, @PathVariable String insulinUnitsPerDay)
    {
        try
        {
            Integer insulinUnitsPerDayValue = Integer.parseInt(insulinUnitsPerDay);
            Float weightKGValue = Float.parseFloat(weightKG);

            return DecimalUtil.format(ClinicalRecord.calculateInsulinPerKg(weightKGValue, insulinUnitsPerDayValue));
        }
        catch (NumberFormatException e)
        {
            e.printStackTrace();
        }
        return "";
    }
}
