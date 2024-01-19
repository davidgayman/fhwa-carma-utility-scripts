#include <iostream>

// SDK Overview
//      Structure
//
//          1. Include the TENA/Middleware/config.h header file
//          2. Create a TENA::Middleware::ApplicationConfiguration
//          3. Initialize the Middleware and obtain its runtime pointer
//          4. Join the execution from the runtime pointer
//
//      Data Types
//
//  ManagedPtr: Any access to a ManagedPtr may be invalidated by a manager between a validity check and subsequent pointer reference. Wrap all ManagedPtr calls in exception catching for InvalidAccess exception.

int main() {

    // Join an execution

    TENA::Middleware::RuntimePtr pTENAmiddlewareRuntime( TENA::Middleware::init( appConfig.tenaConfiguration() ) );
    TENA::Middleware::ExecutionPtr pExecution( pTENAmiddlewareRuntime->joinExecution( endpointVector ) );
    TENA::Middleware::SessionPtr pSession( pExecution->createSession( "Example-Vehicle-Publisher-v7.6.1_Session" ) );

    // Register an exit detector to catch Ctrl+C

    TENA::Middleware::Utils::ExitDetector exitDetector;
    // ...
    if ( exitDetector.exitDetected() )
    {
        break;
    }

    // Register subscriptions
    VUG::Configuration::Scenario::subscribe(
            pSession,
            pScenarioSubscription_,
            false);


    // Attach an observer to a subscription
    VUG::Track::BSM::SubscriptionPtr pVUGTrackBSMSubscription(
            new VUG::Track::BSM::Subscription( pruneExpiredStateChange ) );
    bsmSubscription->addObserver(bsmAlertingObserver);

//    When you're sending you store a X.
//    When you're receiving you store a proxy.

    while (1)
    {
        // Specialized Operations

        // Grab all newly discovered SDO's
        VUG::Track::BSM::SDOlist bsmProxies(
                bsmSubscription->getDiscoveredSDOlist());

        // Process all queued callbacks from the middleware. This exercises the subscriptions.
        pSession->evokeMultipleCallbacks(microsecondsPerIteration);
    }

    // Define a point
    TENA::GeodeticSRF::ImmutableLocalClassPtr pWGS84srf(TENA::GeodeticSRF::create(TENA::RTCODE_WGS_1984_IDENTITY));
    TENA::GeodeticPosition::ImmutableLocalClassPtr const geodeticPos(TENA::GeodeticPosition::create(
            pWGS84srf,
            latitudeInDegrees,
            longitudeInDegrees,
            heightAboveEllipsoidInMeters));

    return 0;
}
