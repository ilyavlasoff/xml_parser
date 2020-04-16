<?php
  class Parser
  {
    /*
    Парсер принимает на вход имя файла для чтения filename,
    корень xml файла, в котором находится массив объектов для преобразования $arrayRoot
    и структура полей для разбора
    */
      public static function parseFiletoArray(string $filename, array $arrayRoot, string $field, array $structure = null) {
        if (!file_exists($filename) || !is_readable($filename) || filesize($filename) === 0) {
          throw new Exception("File $filename doesnt exists");
        }
        $content = file_get_contents($filename);
        $document = new SimpleXMLElement($content, LIBXML_NOCDATA, false);
        if ($document === false) {
          throw new Exception("File $filename doesnt contains valid XML content");
        }
        foreach ($arrayRoot as $node) {
          $document = $document->$node;
        }
        $document = $document->$field;
        $parsedElements = [];
        foreach ($document as $element) {
          $currentElement = [];
          if ($structure) {
            foreach ($structure as $key) {
              $currentElement[$key] = $element->$key;
            }
          }
          else {
            foreach ($element->children() as $key => $value) {
              $currentElement[$key] = $value;
            }
          }
          $parsedElements[] = $currentElement;
        }
        return $parsedElements;
      }
  }
?>
