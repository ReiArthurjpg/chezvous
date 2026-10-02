<?php
declare(strict_types=1);
namespace ChezVous\Shared\View;
final class View { public static function render(string $path, array $data=[]): void { extract($data, EXTR_SKIP); require $path; } public static function e(mixed $value): string { return htmlspecialchars((string)$value, ENT_QUOTES|ENT_SUBSTITUTE, 'UTF-8'); }}
