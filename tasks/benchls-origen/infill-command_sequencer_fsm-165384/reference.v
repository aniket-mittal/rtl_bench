module origen_165384 (
    input CLK,
    input reset,
    output reg [3:0] command
);

    parameter One = 4'd0, Two = 4'd1, Three = 4'd2, Four = 4'd3,
              Five = 4'd4, Six = 4'd5, Seven = 4'd6, Eight = 4'd7,
              Nine = 4'd8, Ten = 4'd9, Eleven = 4'd10, Twelve = 4'd11,
              Thirteen = 4'd12, Fourteen = 4'd13, Fifteen = 4'd14, Black = 4'd15;

    reg [3:0] current, next;
    reg [3:0] return_state;

    always @(posedge CLK or posedge reset) begin
        if (reset)
            current <= One;
        else
            current <= next;
    end

    always @(*) begin
        case (current)
            One:
                begin
                    command = 4'b0001;
                    return_state = Two;
                end
            Two:
                begin
                    command = 4'b0010;
                    return_state = Three;
                end
            Three:
                begin
                    command = 4'b0011;
                    return_state = Four;
                end
            Four:
                begin
                    command = 4'b0100;
                    return_state = Five;
                end
            Five:
                begin
                    command = 4'b0101;
                    return_state = Six;
                end
            Six:
                begin
                    command = 4'b0110;
                    return_state = Seven;
                end
            Seven:
                begin
                    command = 4'b0111;
                    return_state = Eight;
                end
            Eight:
                begin
                    command = 4'b1000;
                    return_state = Nine;
                end
            Nine:
                begin
                    command = 4'b1001;
                    return_state = Ten;
                end
            Ten:
                begin
                    command = 4'b1010;
                    return_state = Eleven;
                end
            Eleven:
                begin
                    command = 4'b1011;
                    return_state = Twelve;
                end
            Twelve:
                begin
                    command = 4'b1100;
                    return_state = Thirteen;
                end
            Thirteen:
                begin
                    command = 4'b1101;
                    return_state = Fourteen;
                end
            Fourteen:
                begin
                    command = 4'b1110;
                    return_state = Fifteen;
                end
            Fifteen:
                begin
                    command = 4'b1111;
                    return_state = Black;
                end
            Black:
                begin
                    command = 4'b0000;
                    next = return_state;
                end
            default:
                begin
                    command = 4'b0000;
                    next = One;
                end
        endcase
    end

endmodule