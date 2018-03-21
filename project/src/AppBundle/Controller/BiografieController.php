<?php

namespace AppBundle\Controller;

use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;

class BiografieController extends Controller
{
    /**
     * @Route("/biografie/{naam}", name="biografie")
     */
    public function biografieAction(Request $request, $naam)
    {
        // replace this example code with whatever you need
        return $this->render('biografie/biografie.html.twig', [
            'naam' => $naam,
        ]);
    }

}