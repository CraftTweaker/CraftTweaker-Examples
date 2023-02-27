import crafttweaker.api.text.Component;

var tooltip = Component.literal("May explode! Thread carefully").setStyle(<constant:formatting:red>);

<item:minecraft:tnt>.addTooltip(tooltip);
<item:minecraft:tnt>.addTooltip("May also be dropped by certain mobs");