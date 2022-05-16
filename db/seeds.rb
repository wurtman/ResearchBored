tag_html = Tag.create(shortname: 'html', display_name: 'HTML', description: 'All about HTML and Markdown')
tag_js = Tag.create(shortname: 'js', display_name: 'JavaScript', description: 'Everything about JavaScript')

Article.create(publication_date: "Mon, 31 Jan 2022 15:34:24 +0100".to_date, tags: [tag_html], slug: 'markdown-syntax', title: 'Markdown Syntax Guide', is_published: true, description: "An article about Markdown, and a demo of all possible elements", kontent: "This article offers a sample of basic Markdown syntax that can be used in any content files, also it shows whether basic HTML elements are decorated with CSS.\\k\\k## Headings\\k\\kThe following HTML `<h1>`—`<h6>` elements represent six levels of section\\kheadings. `<h1>` is the highest section level while `<h6>` is the lowest.\\k\\k# H1\\k## H2\\k### H3\\k#### H4\\k##### H5\\k###### H6\\k\\k## Paragraph\\k\\kXerum, quo qui aut unt expliquam qui dolut labo. Aque venitatiusda cum,\\kvoluptionse latur sitiae dolessi aut parist aut dollo enim qui voluptate ma\\kdolestendit peritin re plis aut quas inctum laceat est volestemque commosa as\\kcus endigna tectur, offic to cor sequas etum rerum idem sintibus eiur? Quianimin\\kporecus evelectur, cum que nis nust voloribus ratem aut omnimi, sitatur?\\kQuiatem. Nam, omnis sum am facea corem alique molestrunt et eos evelece arcillit\\kut aut eos eos nus, sin conecerem erum fuga. Ri oditatquam, ad quibus unda\\kveliamenimin cusam et facea ipsamus es exerum sitate dolores editium rerore\\keost, temped molorro ratiae volorro te reribus dolorer sperchicium faceata\\ktiustia prat.\\k\\kItatur? Quiatae cullecum rem ent aut odis in re eossequodi nonsequ idebis ne\\ksapicia is sinveli squiatum, core et que aut hariosam ex eat.\\k\\k## Blockquotes\\k\\kThe blockquote element represents content that is quoted from another source,\\koptionally with a citation which must be within a `footer` or `cite` element,\\kand optionally with in-line changes such as annotations and abbreviations.\\k\\k#### Blockquote without attribution\\k\\k> Tiam, ad mint andaepu dandae nostion secatur sequo quae.\\k> **Note** that you can use *Markdown syntax* within a blockquote.\\k\\k#### Blockquote with attribution\\k\\k> Don't communicate by sharing memory, share memory by communicating.<br>\\k> — <cite>Rob Pike[^1]</cite>\\k\\k> All men by nature desire to know.<br>\\k> ― <cite>Aristotle[^2]</cite>\\k\\k## Tables\\k\\kTables aren't part of the core Markdown spec, but Bootrails supports them\\kout-of-the-box.\\k\\k   Name | Age\\k--------|------\\k    Bob | 27\\k  Alice | 23\\k\\k#### Inline Markdown within tables\\k\\k| Italics   | Bold     | Code   |\\k| --------  | -------- | ------ |\\k| *italics* | **bold** | `code` |\\k\\k## Code Blocks\\k\\k#### Code block with backticks\\k\\k```html\\k<!doctype html>\\k<html lang=\"en\">\\k<head>\\k  <meta charset=\"utf-8\">\\k  <title>Example HTML5 Document</title>\\k</head>\\k<body>\\k  <p>Test</p>\\k</body>\\k</html>\\k```\\k\\k#### Code block indented with four spaces\\k\\k    <!doctype html>\\k    <html lang=\"en\">\\k    <head>\\k      <meta charset=\"utf-8\">\\k      <title>Example HTML5 Document</title>\\k    </head>\\k    <body>\\k      <p>Test</p>\\k    </body>\\k    </html>\\k\\k## List Types\\k\\k#### Ordered List\\k\\k1. First item\\k2. Second item\\k3. Third item\\k\\k#### Unordered List\\k\\k- List item\\k- Another item\\k- And another item\\k\\k#### Nested list\\k\\k- Fruit\\k  - Apple\\k  - Orange\\k  - Banana\\k- Dairy\\k  - Milk\\k  - Cheese\\k\\k## Other Elements — abbr, sub, sup, kbd, mark\\k\\k<abbr title=\"Graphics Interchange Format\">GIF</abbr> is a bitmap image format.\\k\\kH<sub>2</sub>O\\k\\kX<sup>n</sup> + Y<sup>n</sup> = Z<sup>n</sup>\\k\\kPress <kbd><kbd>CTRL</kbd>+<kbd>ALT</kbd>+<kbd>Delete</kbd></kbd> to end the\\ksession.\\k\\kMost <mark>salamanders</mark> are nocturnal, and hunt for insects, worms, and\\kother small creatures.\\k\\k---\\k<!-- Note: There must be a blank line between every two lines of the footnote difinition.  -->\\k[^1]: The above quote is excerpted from Rob Pike's [talk](https://www.youtube.com/watch?v=PAAkCSZUG1c)\\kduring Gopherfest, November 18, 2015.\\k\\k[^2]: The quote is the first sentence of Aristotle's [Metaphysics](http://classics.mit.edu/Aristotle/metaphysics.html).")
Article.create(publication_date: "Tue, 1 Feb 2022 09:42:02 +0100".to_date, tags: [tag_html, tag_js], slug: 'js-functions', title: 'JavaScript Functions', is_published: true, description: 'An article about JS', kontent: "Generally speaking, a function is a \"subprogram\" that can be called by code external (or internal in the case of recursion) to the function. Like the program itself, a function is composed of a sequence of statements called the function body. Values can be passed to a function, and the function will return a value.\\k\\kIn JavaScript, functions are first-class objects, because they can have properties and methods just like any other object. What distinguishes them from other objects is that functions can be called. In brief, they are Function objects.\\k\\kFor more examples and explanations, see also the JavaScript guide about functions.\\k\\k## Description\\k\\kEvery function in JavaScript is a Function object. See Function for information on properties and methods of Function objects.\\k\\kTo return a value other than the default, a function must have a return statement that specifies the value to return. A function without a return statement will return a default value. In the case of a constructor called with the new keyword, the default value is the value of its this parameter. For all other functions, the default return value is undefined.\\k\\kThe parameters of a function call are the function's arguments. Arguments may be passed by value (in the case of primitive values) or by reference (in the case of objects). This means that if a function reassigns a primitive type parameter, the value won't change outside the function. In the case of an object type parameter, if its properties are mutated, the change will impact outside of the function. See the following example:\\k\\k```js\\k\\k/* Declare the function 'myFunc' */\\kfunction myFunc(theObject) {\\k  theObject.brand = \"Toyota\";\\k}\\k\\k/*\\k * Declare variable 'mycar';\\k * create and initialize a new Object;\\k * assign reference to it to 'mycar'\\k */\\kvar mycar = {\\k  brand: \"Honda\",\\k  model: \"Accord\",\\k  year: 1998\\k};\\k\\k/* Logs 'Honda' */\\kconsole.log(mycar.brand);\\k\\k/* Pass object reference to the function */\\kmyFunc(mycar);\\k\\k/*\\k * Logs 'Toyota' as the value of the 'brand' property\\k * of the object, as changed to by the function.\\k */\\kconsole.log(mycar.brand);\\k\\k```\\k\\k## Defining functions\\k\\kThere are several ways to define functions:\\k\\k### The function declaration (function statement)\\k\\kThere is a special syntax for declaring functions (see function statement for details):\\k\\k```js\\kfunction name([param[, param[, ... param]]]) {\\k   statements\\k}\\k\\k```")

Account.create!(email: "admin@example.com", password: "Mysecret+1234", status: "verified", role: "admin", profile: Profile.create!(name: "Default_Admin")) 
Account.create!(email: "customer@example.com", password: "Mysecret+1234", status: "verified", role: "customer", profile: Profile.create!(name: "Default_Customer")) 

Editable.create!(shortname: 'quote-of-landing-page', kontent: '<div class="flex-center">\k  <div class="display-1">\k    ❝\k  </div>\k  <div>\k    <figure class="m-0">\k      <blockquote class="m-0 border-0 bg-dark">\k        <em class="d-block h4 m-0 text-white">Strong focus here on huge benefit.</em>\k        <em class="d-block h4 m-0 text-white">Insist on what user actually save.</em>\k      </blockquote>\k    </figure>          \k  </div>\k</div>', description: 'Middle of the landing page : large quote to emphasize on added value.')
Editable.create!(shortname: 'terms-and-conditions', kontent: "# Terms and Conditions\\k\\kPlease read these Terms and Conditions carefully before using the Service.\\k\\k\\k## Acknowledgment\\k\\kThese are the Terms and Conditions governing the use of this Service and the agreement that operates between you and us. These Terms and Conditions set out the rights and obligations of all users regarding the use of the Service.\\k\\k## Eligibility\\k\\kBy agreeing to these Terms, you represent and warrant to us: (i) that you are at least eighteen (18) years of age; (ii) that you have not previously been suspended or removed from our Service and (iii) that your use of our Service is in compliance with any and all applicable laws and regulations.\\k\\k## Termination\\k\\kWe may at our sole discretion suspend or terminate your access to our Service at any time, with or without notice for any reason or no reason at all. We also reserve the right to modify or discontinue the Service at any time (including, without limitation, by limiting or discontinuing certain features of the Service) without notice to you. We will have no liability whatsoever on account of any change to the Service or any suspension or termination of your access to or use of the Service.\\k\\k## Third-party websites\\k\\kThe Service may contain links to third-party websites or services that are not owned or controlled by us.\\k\\kWe have no control over, and assume no responsibility for, the content, privacy policies, or practices of any third party websites or services. You further acknowledge and agree that the Company shall not be responsible or liable, directly or indirectly, for any damage or loss caused or alleged to be caused by or in connection with the use of or reliance on any such content, goods or services available on or through any such websites or services.\\k\\kWe strongly advise you to read the terms and conditions and privacy policies of any third-party websites or services that you visit.\\k\\k## Prohibited uses\\k\\kAs a condition of your use of the Service, you will not use the Service for any purpose that is unlawful or prohibited by these Terms. You may not use the Service in any manner that could damage, disable, overburden, disrupt or impair any of our servers or APIs, or any networks connected to any of our server or APIs, or that could interfere with any other party's use and enjoyment of any Service. You may not transmit any viruses, worms, defects, Trojan horses, or any items of a destructive nature through your use of Service.\\k\\k## Limitation of liability\\k\\kIN NO EVENT WILL THE COMPANY ENTITIES BE LIABLE TO YOU OR ANY THIRD PARTY FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, CONSEQUENTIAL, OR PUNITIVE DAMAGES ARISING OUT OF OR RELATING TO YOUR ACCESS TO OR USE OF, OR YOUR INABILITY TO ACCESS OR USE, THE SERVICE OR ANY MATERIALS OR CONTENT ON THE SERVICE, WHETHER BASED ON WARRANTY, CONTRACT, TORT (INCLUDING NEGLIGENCE), STATUTE, OR ANY OTHER LEGAL THEORY, WHETHER OR NOT THE COMPANY ENTITIES HAVE BEEN INFORMED OF THE POSSIBILITY OF SUCH DAMAGE.\\k\\k", description: 'All content for terms and condition')

Setting.create!(shareable_draft: true, clock_diff: 0)
