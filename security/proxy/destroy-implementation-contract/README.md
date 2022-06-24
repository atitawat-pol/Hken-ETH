# Destroying the upgradeable proxy pattern with selfdestruct

proxy -> Implementation (delegatecall) -> innerImplementation

A calls B, sends 100 wei
        B delegatecall C
A ---> B ---> C
                msg.sender = A
                msg.value = 100
                execute code on B's state variables
                use ETH in B