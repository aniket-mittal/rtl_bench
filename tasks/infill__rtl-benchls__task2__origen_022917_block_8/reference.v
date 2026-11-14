module origen_022917 (
    input wire CLK,
    input wire RST_N,
    input wire [9:0] ADDR_IN,
    output wire [9:0] ADDR0,
    output wire [9:0] ADDR1,
    output wire [9:0] ADDR2,
    output wire [9:0] ADDR3,
    output wire [9:0] ADDR4,
    output wire [9:0] ADDR5,
    output wire [9:0] ADDR6,
    output wire [9:0] ADDR7,
    output wire [9:0] ADDR8
);

    reg [9:0] reg_addr0, reg_addr1, reg_addr2, reg_addr3, reg_addr4;
    reg [9:0] reg_addr5, reg_addr6, reg_addr7, reg_addr8;

    always @(posedge CLK or negedge RST_N) begin
        if (!RST_N) begin
            reg_addr0 <= 10'b0;
            reg_addr1 <= 10'b0;
            reg_addr2 <= 10'b0;
            reg_addr3 <= 10'b0;
            reg_addr4 <= 10'b0;
            reg_addr5 <= 10'b0;
            reg_addr6 <= 10'b0;
            reg_addr7 <= 10'b0;
            reg_addr8 <= 10'b0;
        end else begin
            reg_addr0 <= ADDR_IN;
            reg_addr1 <= reg_addr0;
            reg_addr2 <= reg_addr1;
            reg_addr3 <= reg_addr2;
            reg_addr4 <= reg_addr3;
            reg_addr5 <= reg_addr4;
            reg_addr6 <= reg_addr5;
            reg_addr7 <= reg_addr6;
            reg_addr8 <= reg_addr7;
        end
    end

    assign ADDR0 = reg_addr0;
    assign ADDR1 = reg_addr1;
    assign ADDR2 = reg_addr2;
    assign ADDR3 = reg_addr3;
    assign ADDR4 = reg_addr4;
    assign ADDR5 = reg_addr5;
    assign ADDR6 = reg_addr6;
    assign ADDR7 = reg_addr7;
    assign ADDR8 = reg_addr8;

endmodule