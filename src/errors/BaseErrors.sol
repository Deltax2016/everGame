pragma ton-solidity ^0.47.0;

/**
    Reserved codes - 100-199
 */
library BaseErrors {
    uint8 constant message_sender_is_not_my_owner = 100;
    uint8 constant token_not_minted = 101;
    uint8 constant token_already_granted = 102;
    uint8 constant wrong_token_id = 103;
    uint8 constant not_enough_value = 104;
    uint8 constant wrong_manager_address = 105;
    uint8 constant sender_is_not_manager = 106;
    uint8 constant not_enough_balance_to_withdraw = 107;
}