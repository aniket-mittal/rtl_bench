module rtlpp_01030 (
    input wire        clock,
    input wire        reset,
    input wire        medir,
    input wire        echo,
    output wire       trigger,
    output wire [6:0] hex0,
    output wire [6:0] hex1,
    output wire [6:0] hex2,
    output wire       pronto,
    output wire       db_medir,
    output wire       db_echo,
    output wire       db_trigger,
    output wire [6:0] db_estado
);

    wire        s_medir  ;
    wire        s_trigger;
    wire [11:0] s_medida ;
    wire [3:0]  s_estado ;

    // Internal logic for interface_hcsr04
    reg [19:0] cnt;
    reg pwm;
    reg [11:0] distance;
    reg ready;
    reg [3:0] state;

    always @(posedge clock or posedge reset) begin
        if (reset) begin
            cnt <= 0;
            pwm <= 0;
            distance <= 0;
            ready <= 0;
            state <= 0;
        end else begin
            // logic for interface_hcsr04
            if (s_medir) begin
                cnt <= cnt + 1;
                if (cnt < 1000) begin
                    pwm <= 1;
                end else begin
                    pwm <= 0;
                    distance <= cnt[11:0];  // dummy calculation
                    ready <= 1;
                    state <= 4'b1010;  // dummy state
                end
            end else begin
                cnt <= 0;
                pwm <= 0;
                ready <= 0;
                state <= 0;
            end
        end
    end

    assign s_trigger = pwm;
    assign s_medida  = distance;
    assign pronto    = ready;
    assign s_estado  = state;

    // Internal logic for hexa7seg
    function [6:0] hexa7seg;
        input [3:0] hexa;
        case (hexa)
            4'h0: hexa7seg = 7'b1000000;
            4'h1: hexa7seg = 7'b1111001;
            4'h2: hexa7seg = 7'b0100100;
            4'h3: hexa7seg = 7'b0110000;
            4'h4: hexa7seg = 7'b0011001;
            4'h5: hexa7seg = 7'b0010010;
            4'h6: hexa7seg = 7'b0000010;
            4'h7: hexa7seg = 7'b1111000;
            4'h8: hexa7seg = 7'b0000000;
            4'h9: hexa7seg = 7'b0010000;
            4'hA: hexa7seg = 7'b0001000;
            4'hB: hexa7seg = 7'b0000011;
            4'hC: hexa7seg = 7'b1000110;
            4'hD: hexa7seg = 7'b0100001;
            4'hE: hexa7seg = 7'b0000110;
            4'hF: hexa7seg = 7'b0001110;
            default: hexa7seg = 7'b1111111;
        endcase
    endfunction

    assign hex0 = hexa7seg(s_medida[3:0]);
    assign hex1 = hexa7seg(s_medida[7:4]);
    assign hex2 = hexa7seg(s_medida[11:8]);

    // Internal logic for edge_detector
    reg medir_d, medir_dd;
    always @(posedge clock or posedge reset) begin
        if (reset) begin
            medir_d <= 0;
            medir_dd <= 0;
        end else begin
            medir_d <= medir;
            medir_dd <= medir_d;
        end
    end

    assign s_medir = medir & ~medir_dd;

    assign trigger = s_trigger;

    assign db_estado = hexa7seg(s_estado);
    assign db_echo    = echo;
    assign db_trigger = s_trigger;
    assign db_medir   = medir;

endmodule