module origen_141007 (
    input wire rstn,
    input wire sw_clk,
    input wire [3:0] qos1,
    input wire [3:0] qos2,
    input wire prt_dv1,
    input wire prt_dv2,
    input wire [31:0] prt_data1,
    input wire [31:0] prt_data2,
    input wire [31:0] prt_addr1,
    input wire [31:0] prt_addr2,
    input wire [3:0] prt_bytes1,
    input wire [3:0] prt_bytes2,
    
    output reg prt_ack1,
    output reg prt_ack2,
    output reg prt_req,
    output reg [31:0] prt_data,
    output reg [31:0] prt_addr,
    output reg [3:0] prt_bytes,
    output reg [3:0] prt_qos
);

    // State machine states
    localparam IDLE = 2'b00;
    localparam GRANT1 = 2'b01;
    localparam GRANT2 = 2'b10;

    reg [1:0] state, next_state;
    reg last_served;

    always @(posedge sw_clk or negedge rstn) begin
        if (!rstn) begin
            state <= IDLE;
            last_served <= 0;
        end else begin
            state <= next_state;
        end
    end

    always @(*) begin
        next_state = state;
        prt_ack1 = 0;
        prt_ack2 = 0;
        prt_req = 0;
        prt_data = 32'b0;
        prt_addr = 32'b0;
        prt_bytes = 4'b0;
        prt_qos = 4'b0;

        case (state)
            IDLE: begin
                if (prt_dv1 && prt_dv2) begin
                    if (qos1 > qos2) begin
                        next_state = GRANT1;
                    end else if (qos2 > qos1) begin
                        next_state = GRANT2;
                    end else begin
                        next_state = last_served ? GRANT2 : GRANT1;
                    end
                end else if (prt_dv1) begin
                    next_state = GRANT1;
                end else if (prt_dv2) begin
                    next_state = GRANT2;
                end
            end

            GRANT1: begin
                prt_ack1 = 1;
                prt_req = 1;
                prt_data = prt_data1;
                prt_addr = prt_addr1;
                prt_bytes = prt_bytes1;
                prt_qos = qos1;
                last_served = 0;
                
                if (!prt_dv1) begin
                    next_state = IDLE;
                end
            end

            GRANT2: begin
                prt_ack2 = 1;
                prt_req = 1;
                prt_data = prt_data2;
                prt_addr = prt_addr2;
                prt_bytes = prt_bytes2;
                prt_qos = qos2;
                last_served = 1;
                
                if (!prt_dv2) begin
                    next_state = IDLE;
                end
            end

            default: begin
                next_state = IDLE;
            end
        endcase
    end

endmodule