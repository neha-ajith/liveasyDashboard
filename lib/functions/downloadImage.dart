import 'dart:html';

saveDocument(url) {
  AnchorElement anchorElement = AnchorElement(href: url);
  anchorElement.download = "Image";
  anchorElement.click();
}
