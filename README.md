# Social-Media-Data-Mining 

A Social Media Data Mining Project for French

Find the full article at: [soon to come]

------------------------------------ 

AIM OF THE PROJECT 

------------------------------------ 

This NLU project processes French tweets, extracting information about their content and their peculiar language. Indeed, on social media speakers make frequent use of slang expressions, which French is particularly rich in. 

We downloaded a dataset from [Kaggle](https://www.kaggle.com/cibeah/french-tweets-politique) containing about 7000 French tweets focused on politics, particularly on the 2018 Russian elections and the political situation in France. This model is a perfect fit for datasets pertaining to this field but can be easily adapted to analyze tweets relating to different domains. 

In this project, you will find French tweets to try out our model and get a more immediate understanding of how it works and what it extracts. 

Feel free to play with the model and customize it for further use. Our extraction classes, as well as our rules, can be modified and adapted for other purposes. You could try to analyze communication on other social media, tailor the model to other languages and other fields that go beyond politics, or even add sentiment analysis to it. 

------------------------------------ 

METHOD 

------------------------------------ 

We selected 12 extraction classes. 

9 dedicated to the tweets’ content: 

-	People 

-	Locations 

-	Institutions 

-	Political Parties 

-	Companies 

-	Dates 

-	URLs 

-	Percentages 

-	Quotes 

3 to pull out structures and expressions that are typical of French and social media: 

-	Hashtags 

-	Users 

-	Slang (emoticons, colloquialisms, abbreviations, idioms, as well as verlan and argot words) 

Considering the peculiarities of online conversation and the challenges we had to face, we opted for a symbolic approach. This approach focuses on using linguistic rules to manipulate natural language by generating rule-based NLP models. It allowed us to teach the machine how to recognize informal expressions and fundamental information in each tweet, imitating the way we, as humans, would naturally do it. 

To take advantage of this approach to its fullest, we chose to use Expert.ai Studio, a development environment for creating extraction and categorization rules that leverage expert.ai NLU technology. On any submitted text, its core technology operates a syntactical, grammatical, semantic, and morphological analysis, which is empowered by the knowledge graph. The knowledge graph is a language-related network of interconnected concepts that provides the technology with world knowledge and context to resolve ambiguities. 

Tokenization, PoS tagging, word normalization, and sentence parsing, combined with the semantic analysis empowered by the knowledge graph, provide an in-depth, ready-to-use basis for the construction of extraction rules. 

------------------------------------ 

FEATURES 

------------------------------------ 

We used a combination of all the different features provided by Expert.ai Studio to create rules that would be as comprehensive as possible. 

KEYWORD (Ctrl + Shift + K): this attribute allows you to extract an exact sequence of characters (e.g., only a specific inflection of a word). 

LEMMA (Ctrl + Shift + L): this attribute matches any inflection of a given token contained in the knowledge graph. 

ANCESTOR (Ctrl + Shift + A): based on the knowledge graph’s representation of the world, this attribute enables you to extract an entire branch of interconnected concepts in all their inflected forms (e.g., under the concept "parti politique" you can find narrower concepts like "coalition", "centre gauche", "antifascisme" as well as a list of French and foreign political parties). To use an ancestor in a rule you need to specify the numeric ID of the parent syncon. 

SYNCON (Ctrl + Shift + S): this attribute refers to a single concept and all the related lemmas. To use a syncon in a rule you need to specify its numeric ID. 

LIST: this attribute allows you to extract a token that matches one of the lemmas contained in a syncon (specified through its numeric ID), regardless of the concept that the syncon represents. 

TYPE: based on named entity recognition this tool can automatically identify and extract different kinds of entities from a given text like dates, percentages, URLs, locations, companies, and people’s names. 

LOAD (LISTS): external files gathering lists of items can be quickly loaded into rules. For example, we used lists of French political parties, French and international mass media companies, slang words, and abbreviations that were not present in the knowledge graph. When loading a list into a rule, you can decide whether to extract the list’s items as LEMMAS, SYNCONS, or KEYWORDS. 

TAG: this attribute allows you to assign a specific label to an expression or a word, thus manipulating the disambiguation output. To assign a tag label you need first to declare your tags in the config file. Then you have to create a tagging rule: every time the rule triggers, the specified tag label will be assigned to the portion of text that matches the linguistic condition of the rule. Tagging the expressions of our lists as colloquialism or abbreviation, for instance, allowed us to exclude all those occurrences from the extraction of other categories. As an example, we realized that abbreviations with a capital letter, at the beginning of a sentence, could be mistaken for proper names. The tagger attribute helped us bypass this problem. 

PATTERN: an attribute based on the insertion of regular expressions into rules. This feature gives you the possibility to match lines of characters that do not correspond to already existing lemmas or keywords. 

ROLE: through this attribute you can leverage Studio’s sentence structure analysis to extract full strings of text (e.g., informal expressions that pertained to the clause level). This allowed us, for example, to extract the subject of a clause, regardless of its form (a single pronoun, a noun phrase, a human proper name, etc.) with its verb. 

These are the main attributes we used, they can be combined together using Boolean or positional operators creating infinite combinations. But this is just a partial introduction to what can be done with expert.ai Studio. You can find more information [here](https://docs.expert.ai/studio/latest).

------------------------------------ 

HOW TO DEVELOP EXTRACTION RULES 

------------------------------------ 

Creating the rules file: 

- Right-click on the rules folder. 

- Select New and Rules File. 

- Name the rules file (e.g., extraction). 

- Your .cr file will be automatically inserted in the rules folder and featured in the main.cr file. 

Creating the extraction rules: 

- Define the extraction templates in the config.cr file. 

```
TEMPLATE(EXTRACTION NAME)
{
	@FIELD
} 
```

- In the rules file, for each rule, specify: 

1)	The SCOPE - the portion of text in which a single rule has to be verified (standard options: PARAGRAPH, SENTENCE, CLAUSE, PHRASE). 

2)	The FIELD - one of the extraction classes previously defined in the config.cr file. 

3)	The LINGUISTIC CONDITION - the attribute or the combination of attributes you want to use to extract a given item. 

```
SCOPE SENTENCE 
{ 
	IDENTIFY(EXTRACTION NAME) 
	{ 
		@FIELD[linguistic condition] 
	} 
} 
```

- Here’s an example of a template and a relative rule: 

```
TEMPLATE(USERS) 
{ 
	@USER 
} 
```
```
SCOPE SENTENCE 
{ 
	IDENTIFY(USERS) 
	{ 
		@USER[SYNCON(275322) + SYNCON(UNKNOWN)]//@SYN: #275322# [twitter account] 
	} 
} 
```
- Once you have created the rule, remember to compile by pressing F6 or clicking on the Build button in the upper right corner. 

- If an error message appears, you can find more details in the Console panel below. Here you are told what the problem is about and given suggestions for possible solutions. 

- If you are unsure about a rule and want to put it on hold, you can comment it by using the default shortcut Ctrl+/. All shortcuts can be customized in the Studio settings panel. 

- To keep track of changes or remember details related to a single rule, you can add a comment on top of it (your comment needs to be preceded by //). 

Analyzing a document: 

- You will find the dataset you uploaded in the test folder of the project panel (from here you can load more documents if you need to). 

- Double click on a document and analyze it by pressing F5 or clicking on the Analyze button (next to Build). 

- Expand the Extraction panel (horizontal panel bar below) to see your rules results. From here you can go back to a rule that triggered and modify it if necessary. 

- Next to the Extraction panel, you have direct access to the semantic analysis carried out by the system (from here you can trace back the syncon and ancestor associated with every token of the text). 

- Open the Disambiguation Info tab (vertical panel bar on the right) to view all standard domains, relevant elements, and entities natively identified by the core technology. 

Testing the rules: 

- To test your rules, you need to annotate your documents first. Select a dataset to be used as test set. 

- Open a document, select an item, right-click on it, select "Annotate Extraction". 

- The system may suggest you a template and field among the ones in your config.cr file. You can either accept the suggestion or click on "Annotate" to manually fill in the template and field entries. You can see a recap of your annotations for each document in the Annotation panel on the right, in the "Extraction" tab. 

- If you analyze again, in the "Quality" tab of the Annotation panel, you will be automatically given Precision, Recall, and F-Measure values for the annotated text. 

- To get a general overview of the quality of your model, you can click on the "Analyze All Documents" button (next to the "Analyze" button). The Report tab on the left will display values of Precision, Recall, and F-Measure for each document. 

------------------------------------ 

MODEL CONTENT 

------------------------------------ 

The project features the following files in the rules folder: 

-	main.jr 

-	main.cr 

-	config.cr 

-	extraction.cr 

-	tagger.cr 

-	abbreviations.cl 

-	colloquial language.cl 

-	colloquial language_2.cl 

-	emoticons.cl 

-	verlan.cl 

-	french political parties.cl 

-	french press.cl 

-	french radio broadcast.cl 

-	french television networks.cl 

-	international newspapers.cl 

-	international radio broadcast.cl 

-	international television networks.cl 

-	nph_f.cl 

-	nph_m.cl 

The .cr and .jr files are configuration files, while the .cl files are lists of items added to our model. 

------------------------------------ 

FILES DESCRIPTION 

------------------------------------ 
 
-	"main.jr" > Allows for scripting pre and post processing stages in javascript before or after the results of the linguistic rules. With the main jr you can pre-process and recondition input texts (i.e., fixing typos or cleaning texts), aggregate extractions as well as create javascript objects and/or functions you can recall in your rules too. 

 

-	"main.cr" > this file contains examples of the structure of categorization and extraction rules, as well as IMPORT statements to load rule files. 

 

-	"config.cr" > the configuration file is where SECTIONS, SEGMENTS, TAGS – if present - and extraction TEMPLATES and FIELDS are defined. 


 
-	"extraction.cr" > it contains all the rules created for each extraction class. 

 

-	"tagger.cr" > it includes a list of rules aimed at assigning labels to specific items. 

 

-	"abbreviations.cl" > this file contains a list of the most used text abbreviations in French. We chose to extract only those that are part of a slang (e.g., "ptdr" is included, while "mr." is not). 

 

-	"colloquial language.cl" > in this file you will find a list of colloquial words or phrases that we loaded as keywords in our rules, as they were not featured in the sensigrafo. 

 

-	"colloquial language_2.cl" > here instead are collected those colloquial words that, being registered on the sensigrafo, could be extracted as lemmas. 

 

-	"emoticons.cl" > a list comprising different punctuation combinations that can be used to create emoticons. 

 

-	"verlan.cl" > this file contains a list of the most used verlan words we wanted to extract. 

 

-	"french political parties.cl" > here is a list of the most popular French political parties (we selected only those with more than 10000 followers on Twitter). 

 

-	"french press.cl" > a list of the main French newspapers (same 10000 follower criterion). 

 

-	"french radio broadcast.cl" > a list of the main French radio broadcasts (same 10000 follower criterion). 

 

-	"french television networks.cl" > a list of the main French television networks (same 10000 follower criterion). 

 

-	"international newspapers.cl" > a list of the main international newspapers (same 10000 follower criterion). 

 

-	"international radio broadcast.cl" > a list of the main international radio broadcasts (same 10000 follower criterion). 

 

-	"international television networks.cl" > a list of the main international television networks (same 10000 follower criterion). 

 

-	"nph_f.cl" > a vast list of international proper human female names. 

 

-	"nph_m.cl" > a vast list of international proper human male names. 

----------------------- 

HOW TO RUN THE PROJECT 

----------------------- 

TUTORIAL 


-	Download this package and unzip it on your local drive 

 

-	Head over to the [Developer Portal](https://developer.expert.ai/) and register 

 

-	Log in to your developer.expert.ai profile and click on the Developer menu (left side of the dashboard) 

 

-	Click on Studio and download the setup (Windows or Linux!!) or click on Download plugin for IntelliJ IDEA if you already have it 

 

-	Install the IDE (it's just a simple wizard) 

 

-	Launch Studio and open this package folder from your local drive 

 

-	Try it out, customize it and leave us feedback! ;) 

 

------------------- 
