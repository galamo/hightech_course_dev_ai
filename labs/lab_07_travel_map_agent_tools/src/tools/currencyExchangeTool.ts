import { convertUsdToNisBulk } from "../services/flightApiService.js";
import { tool } from "@langchain/core/tools";
import { currencyExchangeSchema } from "../schemas/flightSearchSchema.js";

export const currencyExchangeTool = tool(
  ({ pricesInDollar }) => convertUsdToNisBulk(pricesInDollar),
  {
    name: "currency_exchange",
    description:
      "Convert one or more USD prices to Israeli New Shekel (NIS/ILS) in a single bulk call via pricesInDollar. Pass every distinct flight price together. Use when the user asks for prices in NIS, shekels, or ILS. Exchange rate: 1 USD ≈ 3.5 NIS.",
    schema: currencyExchangeSchema,
  }
);
