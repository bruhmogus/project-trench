from datetime import datetime
from pprint import pprint
from openai import OpenAI
from concurrent.futures import ThreadPoolExecutor

class Translator:
    def __init__(self, url="http://localhost:8080/v1", key="sk-no-key-required"):
        self.client = OpenAI(
            base_url=url,
            api_key=key,
        )

    def call_batch(self, messages, workers=4):
        with ThreadPoolExecutor(max_workers=workers) as executor:
            results = list(executor.map(self.call, messages))
        return results
    
    def call(self, data):
        id,message=data
        #print(f"[{datetime.now().strftime("%I:%M:%S %p")}] asking...")
        response = self.client.chat.completions.create(
            model="qwen3.5",
            messages=[
                {
                    "role": "system",
                    "content": 
"""Translate the Russian (Cyrillic) text in the user's message to English.

The user message contains two separate fields:
- ID: a semantic identifier that may provide context.
- TEXT: the text that must be translated.

Use ID only as semantic context. Translate ONLY TEXT.

Return ONLY the translated value.
NEVER return the ID.
NEVER return field names, XML tags, JSON, Markdown, explanations, or any wrapper around the translation.

The input may contain Fluent syntax: placeholders, variables, expressions, spacings, tabulations, and other non-Russian content. These are valid and must NOT be translated, removed, reordered, or considered errors. Preserve them exactly.

Never translate English to Russian.

If TEXT contains no Russian text, return TEXT unchanged.
If TEXT cannot be translated reliably, return TEXT unchanged.

The output must be exactly the value of TEXT, translated when necessary.

Examples:

INPUT:
ID = smart-fridge-list-item
TEXT = {$item} [{$amount}]

OUTPUT: {$item} [{$amount}]

INPUT:
ID = smart-fridge-request-generic
TEXT = Все продажи окончательные

OUTPUT: All sales are final.

INPUT:
ID = delivery-recipient-examine
TEXT = Это предназначено для { $recipient }, { $job }.

OUTPUT: This is for { $recipient }, { $job }.

INPUT:
ID = clumsy-vaulting-fail-message-others
TEXT = { $victim } bonks their head against { THE($bonkable) }!

OUTPUT: { $victim } bonks their head against { THE($bonkable) }!


INPUT:
ID = server-time-ban
TEXT =
    Временный бан на { $mins } { $mins ->
        [one] минуту
        [few] минуты
       *[other] минут
    }.

OUTPUT:
    Temporary ban for { $mins } { $mins ->
        [one] minute
        [few] minutes
       *[other] minutes
    }
"""
                },
                {
                    "role": "user",
                    "content": f"<id>{id}</id>\n<text>{message}</text>"
                }
            ],
            temperature=0,
            extra_body={
                "chat_template_kwargs": {
                    "enable_thinking": False
                }
            }
        )
        return response.choices[0].message.content

if __name__ == "__main__":
    t=Translator()
    responses=t.call_batch([
        ("clumsy-vaulting-fail-forced-message" ," { CAPITALIZE($bonker) } бьёт голову { $victim } о { $bonkable }!"),
        ("clumsy-vaulting-fail-message-user" ,"Вы бьёте свою голову о { $bonkable }!"),
        ("clumsy-vaulting-fail-message-others" ,"{ $victim } бьёт свою голову о { $bonkable }!"),
        ("clumsy-gun-fail-message" ,"Оружие взрывается прямо у вас в лицо!"),
        ("clumsy-hypospray-fail-message" ,"Упс! Вы укололи себя."),
        ("clumsy-catch-fail-message-user" ,"{ CAPITALIZE($item) } бьёт вас по голове!"),
        ("clumsy-catch-fail-message-others","{ CAPITALIZE($item) } бьёт по голове { $catcher }!")
    ])
    pprint(responses)