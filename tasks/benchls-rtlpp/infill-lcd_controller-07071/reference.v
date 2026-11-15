module rtlpp_07071(
    input  clock,
    input  reset,
    input  [8:0] command,
    input  write,
    output reg ack,
    
    output reg [3:0] LCD_D, 
    output reg LCD_E,       
    output LCD_RS,          
    output LCD_RW           
    );

    localparam [4:0]    INIT_1=1, INIT_2=2, INIT_3=3, INIT_4=4, INIT_5=5, INIT_6=6, INIT_7=7, INIT_8=8,
                        CMD_WAIT=9, NOP=10, U_SETUP=11, U_ENAB=12, U_HOLD=13, UL_WAIT=14, L_SETUP=15,
                        L_ENAB=16, L_HOLD=17;

    reg  [18:0] count;
    reg  [18:0] compare;
    reg  [4:0] state;
    wire bell;
    wire long_instr;

    assign LCD_RW = 0;
    assign LCD_RS = command[8];
    assign bell = (count == compare);
    assign long_instr = ((command == 9'b0_0000_0001) || (command[8:1] == 8'b0_0000_001));


    always @(posedge clock) begin
        count <= (reset | bell) ? 19'b0 : count + 1;
    end

    always @(*) begin
        case (state)
            INIT_1   : compare <= 19'd410000;
            INIT_2   : compare <= 19'd24;
            INIT_3   : compare <= 19'd410000;
            INIT_4   : compare <= 19'd24;
            INIT_5   : compare <= 19'd10000;
            INIT_6   : compare <= 19'd24;
            INIT_7   : compare <= 19'd4000;
            INIT_8   : compare <= 19'd24;
            CMD_WAIT : compare <= (long_instr) ? 19'd164000 : 19'd4000;
            NOP      : compare <= 19'h00000;
            U_SETUP  : compare <= 19'd4;
            U_ENAB   : compare <= 19'd23;
            U_HOLD   : compare <= 19'd1;
            UL_WAIT  : compare <= 19'd100;
            L_SETUP  : compare <= 19'd4;
            L_ENAB   : compare <= 19'd23;
            L_HOLD   : compare <= 19'd1;
            default  : compare <= 19'h00000;
        endcase
    end

    always @(posedge clock) begin
        if (reset) begin
            state <= INIT_1;
        end
        else begin
            case (state)
                INIT_1   : state <= (bell)  ? INIT_2   : INIT_1;
                INIT_2   : state <= (bell)  ? INIT_3   : INIT_2;
                INIT_3   : state <= (bell)  ? INIT_4   : INIT_3;
                INIT_4   : state <= (bell)  ? INIT_5   : INIT_4;
                INIT_5   : state <= (bell)  ? INIT_6   : INIT_5;
                INIT_6   : state <= (bell)  ? INIT_7   : INIT_6;
                INIT_7   : state <= (bell)  ? INIT_8   : INIT_7;
                INIT_8   : state <= (bell)  ? CMD_WAIT : INIT_8;
                CMD_WAIT : state <= (bell)  ? NOP      : CMD_WAIT;
                NOP      : state <= (write & ~ack) ? U_SETUP  : NOP;
                U_SETUP  : state <= (bell)  ? U_ENAB   : U_SETUP;
                U_ENAB   : state <= (bell)  ? U_HOLD   : U_ENAB;
                U_HOLD   : state <= (bell)  ? UL_WAIT  : U_HOLD;
                UL_WAIT  : state <= (bell)  ? L_SETUP  : UL_WAIT;
                L_SETUP  : state <= (bell)  ? L_ENAB   : L_SETUP;
                L_ENAB   : state <= (bell)  ? L_HOLD   : L_ENAB;
                L_HOLD   : state <= (bell)  ? CMD_WAIT : L_HOLD;
                default  : state <= 5'b00000;
            endcase
        end
    end

    always @(*) begin
        case (state)
            INIT_1   : begin LCD_E <= 0; LCD_D <= 4'b0000; end
            INIT_2   : begin LCD_E <= 0; LCD_D <= 4'b0011; end
            INIT_3   : begin LCD_E <= 0; LCD_D <= 4'b0000; end
            INIT_4   : begin LCD_E <= 1; LCD_D <= 4'b0011; end
            INIT_5   : begin LCD_E <= 0; LCD_D <= 4'b0000; end
            INIT_6   : begin LCD_E <= 1; LCD_D <= 4'b0011; end
            INIT_7   : begin LCD_E <= 0; LCD_D <= 4'b0000; end
            INIT_8   : begin LCD_E <= 1; LCD_D <= 4'b0010; end
            CMD_WAIT : begin LCD_E <= 0; LCD_D <= 4'b0000; end
            NOP      : begin LCD_E <= 0; LCD_D <= 4'b0000; end
            U_SETUP  : begin LCD_E <= 0; LCD_D <= command[7:4]; end
            U_ENAB   : begin LCD_E <= 1; LCD_D <= command[7:4]; end
            U_HOLD   : begin LCD_E <= 0; LCD_D <= command[7:4]; end
            UL_WAIT  : begin LCD_E <= 0; LCD_D <= 4'b0000; end
            L_SETUP  : begin LCD_E <= 0; LCD_D <= command[3:0]; end
            L_ENAB   : begin LCD_E <= 1; LCD_D <= command[3:0]; end
            L_HOLD   : begin LCD_E <= 0; LCD_D <= command[3:0]; end
            default  : begin LCD_E <= 0; LCD_D <= 4'b0000; end
        endcase
    end

    always @(posedge clock) begin
        ack <= (reset | ~write) ? 0 : (((state == L_HOLD) && (bell == 1'b1)) ? 1 : ack);
    end

endmodule