<?php

namespace AppBundle\Controller;

use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;

class SomethingController extends Controller
{
    /**
     * @Route("/something", name="something")
     */
    public function somethingAction(Request $request)
    {
        // replace this example code with whatever you need
        return $this->render('something/something.html.twig');
    }

}