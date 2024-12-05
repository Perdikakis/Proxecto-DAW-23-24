<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Support\Facades\Log;
use Symfony\Component\HttpFoundation\Response;

class CorsMiddleware
{
    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle($request, Closure $next): Response
    {
        $origin = $request->headers->get('Origin');

        $allowedOrigins = [];

        if (app()->environment('production')) {
            $allowedOrigins = ['https://shop.kakis.es'];
        } else {
            $allowedOrigins = [
                'https://shop.kakis.es',  
                'http://127.0.0.1:5500',
                'http://localhost:5173',
            ];
        }
        
        if ($origin && in_array($origin, $allowedOrigins)) {
            if ($request->getMethod() === "OPTIONS") {
                return response()->json('OK')
                    ->header('Access-Control-Allow-Origin', $origin)
                    ->header('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE, OPTIONS')
                    ->header('Access-Control-Allow-Headers', 'Content-Type, Authorization, X-CSRF-TOKEN')
                    ->header('Access-Control-Allow-Credentials', 'true');
            }

            $response = $next($request);

            $response->headers->set('Access-Control-Allow-Origin', $origin);
            $response->headers->set('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE, OPTIONS');
            $response->headers->set('Access-Control-Allow-Headers', 'Content-Type, Authorization, X-CSRF-TOKEN');
            $response->headers->set('Access-Control-Allow-Credentials', 'true');

            return $response;
        }

        return response()->json(['message' => 'Forbidden'], 403);
    }
}
