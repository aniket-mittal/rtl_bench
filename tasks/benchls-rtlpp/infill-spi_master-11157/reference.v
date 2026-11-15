module rtlpp_11157(
    output  wire            ss,
    output  reg             sck,
    input   wire            clk,
    input   wire            rst,
    input   wire            en,
    input   wire            cpol,
    input   wire            cpha,
    input   wire    [ 3:0]  xfer_len,
    output  wire            busy, 
    output  wire            done, 
    output  wire            i_load, 
    output  wire            i_en, 
    output  wire            tbuf_mosi_oe
);

    parameter  STATE_SIZE  = 3;
    parameter  S_INIT      = 3'h0;
    parameter  S_LOAD0     = 3'h1;
    parameter  S_WRITE0    = 3'h2;
    parameter  S_READ      = 3'h3;
    parameter  S_DONE      = 3'h4;
    parameter  S_LOAD1     = 3'h5;
    parameter  S_WRITE1    = 3'h6;

    reg     [STATE_SIZE:0]  state;
    reg              [4:0]  xfer_cnt;
    reg [ 5:0] controls;
    assign {ss, busy, done, i_load, i_en, tbuf_mosi_oe} = controls;

    always @(state or xfer_cnt or cpol or xfer_len) begin
        case(state)
            S_INIT:   begin if (cpol) sck =  1; else sck =  0; controls = 6'b1_0_0_1_0_0; end
            S_LOAD0:  begin sck = sck; controls = 6'b1_1_0_0_0_0; end
            S_LOAD1:  begin sck = sck; controls = 6'b0_1_0_0_0_0; end
            S_WRITE0: begin sck = sck; controls = 6'b0_1_0_0_1_1; end
            S_WRITE1: begin sck = ~sck; controls = 6'b0_1_0_0_1_1; end
            S_READ:   begin 
                sck = ~sck; 
                if (xfer_cnt < xfer_len + 4) controls = 6'b0_1_0_0_0_1; 
                else controls = 6'b0_1_1_0_0_1; 
            end
            S_DONE:   begin sck = ~sck; controls = 6'b0_1_1_0_0_0; end
        endcase
    end

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            state <= S_INIT;
        end
        else if (en) begin
            case (state)
                S_INIT:    begin xfer_cnt <= 0; state = S_LOAD0; end
                S_LOAD0:    begin xfer_cnt <= 0; if (cpha) state = S_LOAD1; else state = S_WRITE0; end
                S_LOAD1:    state = S_WRITE1;
                S_WRITE0:   begin xfer_cnt <= xfer_cnt + 1; state = S_READ; end
                S_WRITE1:   
                    if (xfer_cnt < xfer_len + 4) begin
                        xfer_cnt <= xfer_cnt + 1;
                        state = S_READ;
                    end
                    else begin
                        state = S_READ;
                    end
                S_READ:     
                    if (xfer_cnt < xfer_len + 4) state = S_WRITE1; 
                    else if (cpha) state = S_INIT; 
                    else state = S_DONE;
                S_DONE:     state = S_INIT;
            endcase
        end
    end
endmodule