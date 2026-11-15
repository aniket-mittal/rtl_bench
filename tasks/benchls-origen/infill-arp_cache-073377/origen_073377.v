module origen_073377 (
    input wire clk,
    input wire reset,
    input wire [31:0] w_ip_addr,
    input wire [47:0] w_mac_addr,
    input wire w_en,
    input wire [31:0] r_ip_addr,
    input wire r_en,
    output reg [47:0] r_mac_addr
);

    reg [80:0] cache [0:7];  // 8 entries, each 81 bits wide
    reg [2:0] next;  // Pointer to next available slot

    integer i;
    reg found;

    [MASKED]

endmodule