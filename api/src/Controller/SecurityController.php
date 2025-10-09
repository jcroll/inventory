<?php

namespace App\Controller;

use Drenso\OidcBundle\Exception\OidcCodeChallengeMethodNotSupportedException;
use Drenso\OidcBundle\Exception\OidcConfigurationException;
use Drenso\OidcBundle\Exception\OidcConfigurationResolveException;
use Drenso\OidcBundle\OidcClientInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\RedirectResponse;
use Symfony\Component\Routing\Attribute\Route;

final class SecurityController extends AbstractController
{
    /**
     * @throws OidcConfigurationException
     * @throws OidcConfigurationResolveException
     * @throws OidcCodeChallengeMethodNotSupportedException
     */
    #[Route('/login', name: 'login')]
    public function login(OidcClientInterface $oidcClient): RedirectResponse
    {
        return $oidcClient->generateAuthorizationRedirect();
    }
}