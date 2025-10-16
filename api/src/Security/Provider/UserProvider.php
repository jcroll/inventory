<?php

namespace App\Security\Provider;

use Drenso\OidcBundle\Exception\OidcException;
use Drenso\OidcBundle\Model\OidcTokens;
use Drenso\OidcBundle\Model\OidcUserData;
use Drenso\OidcBundle\Security\UserProvider\OidcUserProviderInterface;
use Symfony\Component\DependencyInjection\Attribute\Autowire;
use Symfony\Component\Security\Core\User\UserInterface;
use Symfony\Component\Security\Core\User\UserProviderInterface;

class UserProvider implements OidcUserProviderInterface
{
    public function __construct(
        #[Autowire(service: 'security.user.provider.concrete.users')]
        private readonly UserProviderInterface $inner,
    )
    {
    }

    public function refreshUser(UserInterface $user): UserInterface
    {
        return $this->inner->refreshUser($user);
    }

    public function supportsClass(string $class): bool
    {
        return $this->inner->supportsClass($class);
    }

    public function loadUserByIdentifier(string $identifier): UserInterface
    {
        return $this->inner->loadUserByIdentifier($identifier);
    }

    public function ensureUserExists(string $userIdentifier, OidcUserData $userData, OidcTokens $tokens): void
    {
        if (!$this->loadUserByIdentifier($userIdentifier)) {
            throw new OidcException("No user found with username '{$userIdentifier}'");
        }
    }

    public function loadOidcUser(string $userIdentifier): UserInterface
    {
        return $this->loadUserByIdentifier($userIdentifier);
    }
}