module origen_062756 (
    input wire g_clk,
    input wire g_resetn,
    
    // BRAM Interface
    output wire bram_cen,
    output wire [31:0] bram_addr,
    output wire [31:0] bram_wdata,
    output wire [3:0] bram_wstrb,
    input wire bram_stall,
    input wire [31:0] bram_rdata,
    
    // CPU Bus Interface
    input wire enable,
    input wire mem_req,
    output reg mem_gnt,
    input wire mem_wen,
    input wire [3:0] mem_strb,
    input wire [31:0] mem_wdata,
    input wire [31:0] mem_addr,
    output reg mem_recv,
    output reg mem_ack,
    output wire mem_error,
    output reg [31:0] mem_rdata
);

    // FSM states
    localparam FSM_IDLE = 2'b00;
    localparam FSM_RSP  = 2'b01;
    localparam FSM_WAIT = 2'b10;
    localparam FSM_BUF  = 2'b11;

    reg [1:0] fsm_state, fsm_next;
    reg [31:0] buffer_addr, buffer_wdata, buffer_rdata;
    reg [3:0] buffer_wstrb;
    reg buffer_wen;

    // FSM state transition
    always @(posedge g_clk or negedge g_resetn) begin
        if (!g_resetn)
            fsm_state <= FSM_IDLE;
        else
            fsm_state <= fsm_next;
    end

    // FSM next state logic
    always @(*) begin
        fsm_next = fsm_state;
        case (fsm_state)
            FSM_IDLE: if (enable && mem_req) fsm_next = bram_stall ? FSM_BUF : FSM_RSP;
            FSM_RSP:  fsm_next = FSM_WAIT;
            FSM_WAIT: if (!bram_stall) fsm_next = FSM_IDLE;
            FSM_BUF:  if (!bram_stall) fsm_next = FSM_RSP;
        endcase
    end

    // Output logic
    always @(posedge g_clk or negedge g_resetn) begin
        if (!g_resetn) begin
            mem_gnt <= 1'b0;
            mem_recv <= 1'b0;
            mem_ack <= 1'b0;
            mem_rdata <= 32'b0;
            buffer_addr <= 32'b0;
            buffer_wdata <= 32'b0;
            buffer_rdata <= 32'b0;
            buffer_wstrb <= 4'b0;
            buffer_wen <= 1'b0;
        end else begin
            case (fsm_state)
                FSM_IDLE: begin
                    mem_gnt <= enable && mem_req && !bram_stall;
                    mem_recv <= 1'b0;
                    mem_ack <= 1'b0;
                    if (enable && mem_req && bram_stall) begin
                        buffer_addr <= mem_addr;
                        buffer_wdata <= mem_wdata;
                        buffer_wstrb <= mem_strb;
                        buffer_wen <= mem_wen;
                    end
                end
                FSM_RSP: begin
                    mem_recv <= 1'b1;
                    mem_ack <= 1'b1;
                    mem_rdata <= bram_rdata;
                    buffer_rdata <= bram_rdata;
                end
                FSM_WAIT: begin
                    mem_recv <= 1'b0;
                    mem_ack <= 1'b0;
                end
                FSM_BUF: begin
                    mem_gnt <= 1'b1;
                    if (!bram_stall) begin
                        mem_recv <= 1'b1;
                        mem_ack <= 1'b1;
                        mem_rdata <= bram_rdata;
                    end
                end
            endcase
        end
    end

    // BRAM interface assignments
    assign bram_cen = enable && ((fsm_state == FSM_IDLE && mem_req && !bram_stall) || 
                                 (fsm_state == FSM_BUF && !bram_stall));
    assign bram_addr = (fsm_state == FSM_BUF) ? buffer_addr : mem_addr;
    assign bram_wdata = (fsm_state == FSM_BUF) ? buffer_wdata : mem_wdata;
    assign bram_wstrb = (fsm_state == FSM_BUF) ? (buffer_wen ? buffer_wstrb : 4'b0) : 
                                                 (mem_wen ? mem_strb : 4'b0);

    // Error signal (always 0 in this implementation)
    assign mem_error = 1'b0;

endmodule