module origen_162378(
    input [3:0] acc_number,
    input [3:0] pin,
    input action,
    input deAuth,
    output reg wasSuccessful,
    output reg [3:0] accIndex
);

    // Internal databases
    reg [4:0] acc_database [3:0];
    reg [4:0] pin_database [3:0];

    // Initialize the databases
    initial begin
        // Account database
        acc_database[0] = 5'b10001; // Valid account number: 1001
        acc_database[1] = 5'b10010; // Valid account number: 1010
        acc_database[2] = 5'b10100; // Valid account number: 1100
        acc_database[3] = 5'b10111; // Valid account number: 1111

        // PIN database
        pin_database[0] = 5'b10001; // Valid PIN: 1001
        pin_database[1] = 5'b10010; // Valid PIN: 1010
        pin_database[2] = 5'b10100; // Valid PIN: 1100
        pin_database[3] = 5'b10111; // Valid PIN: 1111
    end

    // Reset the authentication state when deAuth is high
    always @(deAuth) begin
        if (deAuth) begin
            wasSuccessful = 1'bx;
        end
    end

    // Authenticate the user
    [MASKED]

endmodule