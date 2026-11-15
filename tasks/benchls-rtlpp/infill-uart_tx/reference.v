module UART_TX (
    input i_Clk,
    input [7:0] i_TX_Byte,
    input i_TX_DV,
    output o_TX_Active,
    output o_TX_Serial
);
    // Mock logic for UART transmission purpose
    assign o_TX_Active = i_TX_DV;
    assign o_TX_Serial = i_TX_Byte[0]; // just a mock serial output
endmodule