module origen_012027 (
    input wire clk,
    input wire [1:0] MEM,
    input wire [31:0] Wdata,
    input wire [31:0] Addr,
    output reg [31:0] Rdata,
    output reg BUSY
);

    reg [2:0] state;
    reg [31:0] d_mem [0:1023];
    reg [9:0] addr_int;
    reg [31:0] Wdata_int;

    localparam INIT = 3'b000, READ1 = 3'b001, WRITE1 = 3'b010, READ2 = 3'b011,
               WRITE2 = 3'b100, READ3 = 3'b101, WRITE3 = 3'b110, READ4 = 3'b111;

    integer i;
    initial begin
        state = INIT;
        d_mem[0] = 32'd1;
        for (i = 1; i < 1024; i = i + 1) begin
            d_mem[i] = 32'd0;
        end
    end

    always @(posedge clk) begin
        case (state)
            INIT: begin
                if (MEM[1]) state <= WRITE1;
                else if (MEM[0]) state <= READ1;
                addr_int <= Addr[9:0];
                Wdata_int <= Wdata;
            end
            READ1: state <= READ2;
            WRITE1: state <= WRITE2;
            READ2: state <= READ3;
            WRITE2: state <= WRITE3;
            READ3: state <= READ4;
            WRITE3: state <= INIT;
            READ4: state <= INIT;
        endcase
    end

    always @(posedge clk) begin
        case (state)
            WRITE3: d_mem[addr_int] <= Wdata_int;
            READ4: Rdata <= d_mem[addr_int];
        endcase
    end

    always @(*) begin
        BUSY = (state == INIT) || (state == READ4) || (state == WRITE3);
    end

endmodule