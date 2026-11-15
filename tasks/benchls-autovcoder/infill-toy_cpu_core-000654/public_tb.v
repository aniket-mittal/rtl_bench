// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 33;
  localparam OW = 74;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_000654 dut (
    .clk(clk),
    .rst(in_vec[32:32]),
    .bus_in(in_vec[31:0]),
    .bus_A(out_vec[73:42]),
    .bus_out(out_vec[41:10]),
    .bus_WE(out_vec[9:9]),
    .bus_RE(out_vec[8:8]),
    .current_opcode(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 33'h193ee7129;
    stim[1] = 33'h11f4e077f;
    stim[2] = 33'h0ddda8121;
    stim[3] = 33'h0e28c7fab;
    stim[4] = 33'h09805101e;
    stim[5] = 33'h095023c11;
    stim[6] = 33'h015a36fce;
    stim[7] = 33'h019ca735b;
    stim[8] = 33'h0a370d89c;
    stim[9] = 33'h0eab96be6;
    stim[10] = 33'h0e0cdee24;
    stim[11] = 33'h0629ac933;
    stim[12] = 33'h0c7df21c9;
    stim[13] = 33'h091db883c;
    stim[14] = 33'h0fffe133e;
    stim[15] = 33'h03aa6fa77;
    stim[16] = 33'h039f7c337;
    stim[17] = 33'h05b0115f2;
    stim[18] = 33'h0ff8cc00b;
    stim[19] = 33'h09be67121;
    stim[20] = 33'h07247115f;
    stim[21] = 33'h029b2218d;
    stim[22] = 33'h07a0d38f8;
    stim[23] = 33'h08c625595;
    stim[24] = 33'h03725a1d3;
    stim[25] = 33'h0827dbae0;
    stim[26] = 33'h01b1187ab;
    stim[27] = 33'h04e03ac54;
    stim[28] = 33'h0e7f17494;
    stim[29] = 33'h063c3d3a7;
    stim[30] = 33'h059ad6d06;
    stim[31] = 33'h0bca6487e;
    stim[32] = 33'h055788c83;
    stim[33] = 33'h0850c0c10;
    stim[34] = 33'h05fa2f585;
    stim[35] = 33'h0cc3f7926;
    stim[36] = 33'h0f4c081c7;
    stim[37] = 33'h0c4c4ec59;
    stim[38] = 33'h0d07e9a40;
    stim[39] = 33'h0f3fe852d;
    stim[40] = 33'h01534da44;
    stim[41] = 33'h0285f2907;
    stim[42] = 33'h0ac2ff6c8;
    stim[43] = 33'h003dc0c5d;
    stim[44] = 33'h03db2cf38;
    stim[45] = 33'h09858c50f;
    stim[46] = 33'h0f1b7d268;
    stim[47] = 33'h05769080c;
    stim[48] = 33'h04b656547;
    stim[49] = 33'h00e21faeb;
    stim[50] = 33'h0b1d3b5a5;
    stim[51] = 33'h0e4038d26;
    stim[52] = 33'h008f443c7;
    stim[53] = 33'h062604cda;
    stim[54] = 33'h06455b96e;
    stim[55] = 33'h06fc16b7b;
    stim[56] = 33'h00579840c;
    stim[57] = 33'h095a9d121;
    stim[58] = 33'h0232a011b;
    stim[59] = 33'h0a472d860;
    stim[60] = 33'h0eebe7e17;
    stim[61] = 33'h0126c0976;
    stim[62] = 33'h0356cbca2;
    stim[63] = 33'h0fb496f65;
    for (c = 0; c < N; c = c + 1) begin
      #1 in_vec = stim[c];
      #3 sample;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 74'hxxxxxxxxxxxxxxxxxff;
      expv[1] = 74'h00000000xxxxxxxxxff;
      expv[2] = 74'h00000000xxxxxxxxxff;
      expv[3] = 74'h00000000xxxxxxxxxff;
      expv[4] = 74'h00000000xxxxxxxxxff;
      expv[5] = 74'h00000000000000000ff;
      expv[6] = 74'h00000000000000000ff;
      expv[7] = 74'h00000000400000001ff;
      expv[8] = 74'h00000000000000000ff;
      expv[9] = 74'h00000000000000000ff;
      expv[10] = 74'h00000000000000000ff;
      expv[11] = 74'h00000000000000000ff;
      expv[12] = 74'h00000000800000001ff;
      expv[13] = 74'h00000000000000000ff;
      expv[14] = 74'h00000000000000000ff;
      expv[15] = 74'h00000000000000000ff;
      expv[16] = 74'h00000000000000000ff;
      expv[17] = 74'h00000000c00000001ff;
      expv[18] = 74'h00000000000000000ff;
      expv[19] = 74'h00000000000000000ff;
      expv[20] = 74'h00000000000000000ff;
      expv[21] = 74'h00000000000000000ff;
      expv[22] = 74'h00000001000000001ff;
      expv[23] = 74'h00000000000000000ff;
      expv[24] = 74'h00000000000000000ff;
      expv[25] = 74'h00000000000000000ff;
      expv[26] = 74'h00000000000000000ff;
      expv[27] = 74'h00000001400000001ff;
      expv[28] = 74'h00000000000000000ff;
      expv[29] = 74'h00000000000000000ff;
      expv[30] = 74'h00000000000000000ff;
      expv[31] = 74'h00000000000000000ff;
      expv[32] = 74'h00000001800000001ff;
      expv[33] = 74'h00000000000000000ff;
      expv[34] = 74'h00000000000000000ff;
      expv[35] = 74'h00000000000000000ff;
      expv[36] = 74'h00000000000000000ff;
      expv[37] = 74'h00000001c00000001ff;
      expv[38] = 74'h00000000000000000ff;
      expv[39] = 74'h00000000000000000ff;
      expv[40] = 74'h00000000000000000ff;
      expv[41] = 74'h00000000000000000ff;
      expv[42] = 74'h00000002000000001ff;
      expv[43] = 74'h00000000000000000ff;
      expv[44] = 74'h00000000000000000ff;
      expv[45] = 74'h00000000000000000ff;
      expv[46] = 74'h00000000000000000ff;
      expv[47] = 74'h00000002400000001ff;
      expv[48] = 74'h00000000000000000ff;
      expv[49] = 74'h00000000000000000ff;
      expv[50] = 74'h00000000000000000ff;
      expv[51] = 74'h00000000000000000ff;
      expv[52] = 74'h00000002800000001ff;
      expv[53] = 74'h00000000000000000ff;
      expv[54] = 74'h00000000000000000ff;
      expv[55] = 74'h00000000000000000ff;
      expv[56] = 74'h00000000000000000ff;
      expv[57] = 74'h00000002c00000001ff;
      expv[58] = 74'h00000000000000000ff;
      expv[59] = 74'h00000000000000000ff;
      expv[60] = 74'h00000000000000000ff;
      expv[61] = 74'h00000000000000000ff;
      expv[62] = 74'h00000003000000001ff;
      expv[63] = 74'h00000000000000000ff;
      mismatches = 0;
      shown = 0;
      for (c = 0; c < N; c = c + 1) begin
        bad = 0;
        for (b = 0; b < OW; b = b + 1)
          if (expv[c][b] !== 1'bx && act[c][b] !== expv[c][b]) bad = 1;
        if (bad) begin
          mismatches = mismatches + 1;
          if (shown < 10) begin
            $display("MISMATCH cycle %0d: inputs=%h expected=%h got=%h", c, stim[c], expv[c], act[c]);
            shown = shown + 1;
          end
        end
      end
      if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
      else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    end
    $finish;
  end
endmodule
