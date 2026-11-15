module origen_108698 (
    input wire clk,
    input wire ce,
    input wire reset,
    input wire cs,
    input wire wr,
    input wire rd,
    input wire a0,
    input wire [7:0] din,
    input wire [7:0] intp,
    output reg int_req,
    input wire int_ack,
    output reg [8:0] int_vector
);

// Configuration registers
reg [7:0] IW1, IW2, IW3, IW4;
reg [7:0] IMW, PFCW, MCW;

// Interrupt registers
reg [7:0] IRR, ISR;
reg [7:0] prev_intp;

// Initialization state machine
reg [2:0] init_state;
localparam UNINIT = 3'd0, INIT_IW2 = 3'd1, INIT_IW3 = 3'd2, INIT_IW4 = 3'd3, INIT_DONE = 3'd4;

// Operating mode flags
wire single_mode, level_triggered, addr_gap_8;
assign single_mode = IW1[1];
assign level_triggered = IW1[3];
assign addr_gap_8 = IW1[2];

always @(posedge clk or posedge reset) begin
    if (reset) begin
        init_state <= UNINIT;
        IW1 <= 8'h00;
        IW2 <= 8'h00;
        IW3 <= 8'h00;
        IW4 <= 8'h00;
        IMW <= 8'hFF;
        PFCW <= 8'h00;
        MCW <= 8'h00;
        IRR <= 8'h00;
        ISR <= 8'h00;
        int_req <= 1'b0;
        int_vector <= 9'h000;
    end else if (ce) begin
        // Initialization sequence
        if (cs && wr && !a0) begin
            case (init_state)
                UNINIT: begin
                    IW1 <= din;
                    init_state <= INIT_IW2;
                end
                INIT_IW2: begin
                    IW2 <= din;
                    init_state <= single_mode ? INIT_DONE : INIT_IW3;
                end
                INIT_IW3: begin
                    IW3 <= din;
                    init_state <= INIT_IW4;
                end
                INIT_IW4: begin
                    IW4 <= din;
                    init_state <= INIT_DONE;
                end
            endcase
        end

        // Normal operation
        if (init_state == INIT_DONE) begin
            // Register writes
            if (cs && wr) begin
                if (a0) IMW <= din;
                else if (din[3:0] == 4'b0001) MCW <= din;
                else if (din[3:0] == 4'b0010) PFCW <= din;
            end

            // Interrupt processing
            if (level_triggered) begin
                IRR <= (IRR | intp) & ~IMW;
            end else begin
                IRR <= (IRR | (intp & ~prev_intp)) & ~IMW;
            end
            prev_intp <= intp;

            // Generate interrupt request
            int_req <= |IRR;

            // Handle interrupt acknowledgment
            if (int_ack) begin
                casez (IRR)
                    8'b???????1: begin ISR[0] <= 1'b1; IRR[0] <= 1'b0; int_vector <= {IW2, 3'd0}; end
                    8'b??????10: begin ISR[1] <= 1'b1; IRR[1] <= 1'b0; int_vector <= {IW2, 3'd1}; end
                    8'b?????100: begin ISR[2] <= 1'b1; IRR[2] <= 1'b0; int_vector <= {IW2, 3'd2}; end
                    8'b????1000: begin ISR[3] <= 1'b1; IRR[3] <= 1'b0; int_vector <= {IW2, 3'd3}; end
                    8'b???10000: begin ISR[4] <= 1'b1; IRR[4] <= 1'b0; int_vector <= {IW2, 3'd4}; end
                    8'b??100000: begin ISR[5] <= 1'b1; IRR[5] <= 1'b0; int_vector <= {IW2, 3'd5}; end
                    8'b?1000000: begin ISR[6] <= 1'b1; IRR[6] <= 1'b0; int_vector <= {IW2, 3'd6}; end
                    8'b10000000: begin ISR[7] <= 1'b1; IRR[7] <= 1'b0; int_vector <= {IW2, 3'd7}; end
                    default: int_vector <= 9'h000;
                endcase
            end
        end
    end
end

endmodule