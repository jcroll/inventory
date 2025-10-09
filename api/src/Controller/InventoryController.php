<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\Routing\Attribute\Route;

final class InventoryController extends AbstractController
{
    #[Route('/api/inventory', name: 'api_inventory')]
    public function index(): JsonResponse
    {
        return $this->json([
            [
                'name' => 'Apple iPhone 17 Pro Max',
                'inventory' => 14,
            ],
            [
                'name' => 'Samsung Galaxy S25+',
                'inventory' => 21,
            ],
        ]);
    }
}
