import Foundation

extension WorkspaceTemplates {
    
    static func script(_ podName: String) -> String {
        let template = {
            """
            #!/bin/bash
            
            # Jump to repository root
            cd "$(git rev-parse --show-toplevel)"

            # Verify if folder already exists
            if [ ! -d "solutions/devsprint-julio-fernandes-8/Support/Output/\(podName)" ]; then
                echo ">> Creating \(podName) module in the root\n"
                cp -R "solutions/devsprint-julio-fernandes-8/Support/MicrofrontendSDK/\(podName)" "solutions/devsprint-julio-fernandes-8/Support/Output/\(podName)"
            else
                echo ">> \(podName) folder already exists";
            fi

            # Check the file is exists or not
            rm -rf "solutions/devsprint-julio-fernandes-8/Support/MicrofrontendSDK/\(podName)"
            echo ">> \(podName) was removed in the MicrofrontendSDK"
            
            #>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
            """
        }()
        return template
    }
}

