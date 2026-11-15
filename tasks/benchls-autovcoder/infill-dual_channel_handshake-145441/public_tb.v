// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 21;
  localparam OW = 18;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_145441 dut (
    .clk(clk),
    .reset(in_vec[20:20]),
    .request_a(in_vec[19:19]),
    .request_b(in_vec[18:18]),
    .ack_a(in_vec[17:17]),
    .ack_b(in_vec[16:16]),
    .data_in_a(in_vec[15:8]),
    .data_in_b(in_vec[7:0]),
    .data_out_a(out_vec[17:10]),
    .data_out_b(out_vec[9:2]),
    .transfer_complete_a(out_vec[1:1]),
    .transfer_complete_b(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 21'h1aaf73;
    stim[1] = 21'h1ba596;
    stim[2] = 21'h008ff1;
    stim[3] = 21'h159f4a;
    stim[4] = 21'h03b83b;
    stim[5] = 21'h0f52b3;
    stim[6] = 21'h0f8826;
    stim[7] = 21'h0805b3;
    stim[8] = 21'h0b005b;
    stim[9] = 21'h0946de;
    stim[10] = 21'h0097a9;
    stim[11] = 21'h07883f;
    stim[12] = 21'h0ab0a5;
    stim[13] = 21'h0b5e9b;
    stim[14] = 21'h0bd6d4;
    stim[15] = 21'h0ac391;
    stim[16] = 21'h0640cf;
    stim[17] = 21'h0fb03e;
    stim[18] = 21'h0677ca;
    stim[19] = 21'h054649;
    stim[20] = 21'h02b787;
    stim[21] = 21'h04c5b3;
    stim[22] = 21'h05176e;
    stim[23] = 21'h0da49f;
    stim[24] = 21'h0bb0bf;
    stim[25] = 21'h036dcf;
    stim[26] = 21'h07235b;
    stim[27] = 21'h008fe1;
    stim[28] = 21'h07907a;
    stim[29] = 21'h06c3c0;
    stim[30] = 21'h0676b9;
    stim[31] = 21'h0ae295;
    stim[32] = 21'h0d29c4;
    stim[33] = 21'h006635;
    stim[34] = 21'h00e768;
    stim[35] = 21'h07fe31;
    stim[36] = 21'h00159a;
    stim[37] = 21'h041ba2;
    stim[38] = 21'h0568cd;
    stim[39] = 21'h057d2d;
    stim[40] = 21'h058c3f;
    stim[41] = 21'h042972;
    stim[42] = 21'h0e9044;
    stim[43] = 21'h0b0dd8;
    stim[44] = 21'h09f492;
    stim[45] = 21'h05482f;
    stim[46] = 21'h015728;
    stim[47] = 21'h00a3b0;
    stim[48] = 21'h02277f;
    stim[49] = 21'h0d4534;
    stim[50] = 21'h042734;
    stim[51] = 21'h0c25e5;
    stim[52] = 21'h099a2a;
    stim[53] = 21'h025214;
    stim[54] = 21'h094aeb;
    stim[55] = 21'h08492d;
    stim[56] = 21'h0d62d4;
    stim[57] = 21'h0e524d;
    stim[58] = 21'h021209;
    stim[59] = 21'h0e8b51;
    stim[60] = 21'h0f41f2;
    stim[61] = 21'h0eb2c9;
    stim[62] = 21'h0ccf9b;
    stim[63] = 21'h0fc21b;
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
      expv[0] = 18'h00000;
      expv[1] = 18'h00000;
      expv[2] = 18'h00000;
      expv[3] = 18'h00000;
      expv[4] = 18'h00000;
      expv[5] = 18'h00000;
      expv[6] = 18'h14802;
      expv[7] = 18'h14800;
      expv[8] = 18'h01402;
      expv[9] = 18'h01400;
      expv[10] = 18'h11802;
      expv[11] = 18'h11802;
      expv[12] = 18'h11800;
      expv[13] = 18'h2c002;
      expv[14] = 18'h2c000;
      expv[15] = 18'h35802;
      expv[16] = 18'h35800;
      expv[17] = 18'h35b3d;
      expv[18] = 18'h2c33f;
      expv[19] = 18'h2c33d;
      expv[20] = 18'h2c125;
      expv[21] = 18'h2c125;
      expv[22] = 18'h2c2cd;
      expv[23] = 18'h2c1b9;
      expv[24] = 18'h291bb;
      expv[25] = 18'h291b9;
      expv[26] = 18'h291b9;
      expv[27] = 18'h2916d;
      expv[28] = 18'h2916d;
      expv[29] = 18'h291e9;
      expv[30] = 18'h29301;
      expv[31] = 18'h292e5;
      expv[32] = 18'h38ae7;
      expv[33] = 18'h38ae7;
      expv[34] = 18'h38ae7;
      expv[35] = 18'h38ae7;
      expv[36] = 18'h38ae5;
      expv[37] = 18'h38ae5;
      expv[38] = 18'h38a89;
      expv[39] = 18'h38b35;
      expv[40] = 18'h388b5;
      expv[41] = 18'h388fd;
      expv[42] = 18'h389c9;
      expv[43] = 18'h241cb;
      expv[44] = 18'h241c9;
      expv[45] = 18'h3d1cb;
      expv[46] = 18'h3d1cb;
      expv[47] = 18'h3d1cb;
      expv[48] = 18'h3d1cb;
      expv[49] = 18'h3d1c9;
      expv[50] = 18'h115cb;
      expv[51] = 18'h115cb;
      expv[52] = 18'h115cb;
      expv[53] = 18'h115cb;
      expv[54] = 18'h115c9;
      expv[55] = 18'h129cb;
      expv[56] = 18'h129cb;
      expv[57] = 18'h129cb;
      expv[58] = 18'h129c9;
      expv[59] = 18'h129c9;
      expv[60] = 18'h22dcb;
      expv[61] = 18'h22dc9;
      expv[62] = 18'h2c9cb;
      expv[63] = 18'h2c9cb;
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
