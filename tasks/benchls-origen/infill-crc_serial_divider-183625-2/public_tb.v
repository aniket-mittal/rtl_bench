// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 36;
  localparam OW = 12;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_183625 dut (
    .clk(clk),
    .reset(in_vec[35:35]),
    .polynom(in_vec[34:23]),
    .datain_a(in_vec[22:12]),
    .datain_b(in_vec[11:1]),
    .enable(in_vec[0:0]),
    .dataout(out_vec[11:1]),
    .valid(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 36'ha7a237b02;
    stim[1] = 36'h9a8b5208e;
    stim[2] = 36'h7f0e2ce42;
    stim[3] = 36'h6de71e497;
    stim[4] = 36'h5ff8494b6;
    stim[5] = 36'h4544670fa;
    stim[6] = 36'h685fbc035;
    stim[7] = 36'h7e2604704;
    stim[8] = 36'h0ffca34dd;
    stim[9] = 36'h6c57af4c3;
    stim[10] = 36'h1150159a8;
    stim[11] = 36'h81b3381fc;
    stim[12] = 36'h040b29dcf;
    stim[13] = 36'h6a0b8b186;
    stim[14] = 36'h3fcec2270;
    stim[15] = 36'h7294fe212;
    stim[16] = 36'h063a41fa9;
    stim[17] = 36'h7dafdb94c;
    stim[18] = 36'h66e0e347d;
    stim[19] = 36'h369359408;
    stim[20] = 36'h353a28c4b;
    stim[21] = 36'h06b9c202d;
    stim[22] = 36'h239c4cb73;
    stim[23] = 36'h56122ea5d;
    stim[24] = 36'h168c22eb7;
    stim[25] = 36'h70fc57f98;
    stim[26] = 36'h4ffe99690;
    stim[27] = 36'h736110be0;
    stim[28] = 36'h7ca039201;
    stim[29] = 36'h55bfc4326;
    stim[30] = 36'h2dde94889;
    stim[31] = 36'h71f92e195;
    stim[32] = 36'h4e25cb3a5;
    stim[33] = 36'h04bf0eb59;
    stim[34] = 36'h2f401da67;
    stim[35] = 36'h6003be2f0;
    stim[36] = 36'h4c51b9ae4;
    stim[37] = 36'h5f8260a05;
    stim[38] = 36'h15ff97016;
    stim[39] = 36'h316806ceb;
    stim[40] = 36'h4c39d3a57;
    stim[41] = 36'h642bab754;
    stim[42] = 36'h0c4c183e2;
    stim[43] = 36'h0eea26878;
    stim[44] = 36'h052cd5cdd;
    stim[45] = 36'h5e4890270;
    stim[46] = 36'h7fa6ff899;
    stim[47] = 36'h0433b6720;
    stim[48] = 36'h0ce9c6ded;
    stim[49] = 36'h65c58b5cc;
    stim[50] = 36'h0406edb8b;
    stim[51] = 36'h6cf8f1996;
    stim[52] = 36'h4a2f87f40;
    stim[53] = 36'h60c4857d4;
    stim[54] = 36'h777c74559;
    stim[55] = 36'h5668b11f8;
    stim[56] = 36'h6426108e6;
    stim[57] = 36'h40ad085c6;
    stim[58] = 36'h4f13a6384;
    stim[59] = 36'h7f35f2bb2;
    stim[60] = 36'h3b780ffc4;
    stim[61] = 36'h40eabf133;
    stim[62] = 36'h794edef7d;
    stim[63] = 36'h17ac97392;
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
      expv[0] = 12'h000;
      expv[1] = 12'h000;
      expv[2] = 12'h000;
      expv[3] = 12'h000;
      expv[4] = 12'h000;
      expv[5] = 12'h000;
      expv[6] = 12'h000;
      expv[7] = 12'h002;
      expv[8] = 12'h002;
      expv[9] = 12'h006;
      expv[10] = 12'h00e;
      expv[11] = 12'h000;
      expv[12] = 12'h000;
      expv[13] = 12'h000;
      expv[14] = 12'h000;
      expv[15] = 12'h000;
      expv[16] = 12'h000;
      expv[17] = 12'h000;
      expv[18] = 12'h000;
      expv[19] = 12'h002;
      expv[20] = 12'h002;
      expv[21] = 12'h006;
      expv[22] = 12'h00c;
      expv[23] = 12'h018;
      expv[24] = 12'h032;
      expv[25] = 12'h064;
      expv[26] = 12'h064;
      expv[27] = 12'h064;
      expv[28] = 12'h064;
      expv[29] = 12'h0ca;
      expv[30] = 12'h0ca;
      expv[31] = 12'h194;
      expv[32] = 12'h328;
      expv[33] = 12'h652;
      expv[34] = 12'h750;
      expv[35] = 12'h653;
      expv[36] = 12'h653;
      expv[37] = 12'h653;
      expv[38] = 12'h653;
      expv[39] = 12'h653;
      expv[40] = 12'hca5;
      expv[41] = 12'h94b;
      expv[42] = 12'h94b;
      expv[43] = 12'h94b;
      expv[44] = 12'h94b;
      expv[45] = 12'h295;
      expv[46] = 12'h295;
      expv[47] = 12'h529;
      expv[48] = 12'h529;
      expv[49] = 12'ha53;
      expv[50] = 12'ha53;
      expv[51] = 12'h4a7;
      expv[52] = 12'h4a7;
      expv[53] = 12'h4a7;
      expv[54] = 12'h4a7;
      expv[55] = 12'h94d;
      expv[56] = 12'h94d;
      expv[57] = 12'h94d;
      expv[58] = 12'h94d;
      expv[59] = 12'h94d;
      expv[60] = 12'h94d;
      expv[61] = 12'h94d;
      expv[62] = 12'h299;
      expv[63] = 12'h531;
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
