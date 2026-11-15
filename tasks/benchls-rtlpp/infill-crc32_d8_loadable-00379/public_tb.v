// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 43;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_00379 dut (
    .CLK(clk),
    .DATA_IN(in_vec[42:35]),
    .RESET(in_vec[34:34]),
    .START(in_vec[33:33]),
    .LOAD(in_vec[32:32]),
    .CRC_IN(in_vec[31:0]),
    .CRC_OUT(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 43'h3c683f151f4;
    stim[1] = 43'h34fa44bafc4;
    stim[2] = 43'h589b5e311d2;
    stim[3] = 43'h0d0fe5e4175;
    stim[4] = 43'h41bec5c8483;
    stim[5] = 43'h1fb0e6a4601;
    stim[6] = 43'h662cc2405b9;
    stim[7] = 43'h60177ece46c;
    stim[8] = 43'h7e93460b75f;
    stim[9] = 43'h01916856567;
    stim[10] = 43'h6f287230166;
    stim[11] = 43'h08af023aa72;
    stim[12] = 43'h568014275a5;
    stim[13] = 43'h022c3b1f029;
    stim[14] = 43'h73b32c0540d;
    stim[15] = 43'h2318777ccb2;
    stim[16] = 43'h659a6d3983f;
    stim[17] = 43'h662cbf50b84;
    stim[18] = 43'h32c48c489e7;
    stim[19] = 43'h363e5847a98;
    stim[20] = 43'h7d9d254fec2;
    stim[21] = 43'h400c8ca13b8;
    stim[22] = 43'h72b686dc999;
    stim[23] = 43'h2f8e54e3fed;
    stim[24] = 43'h4286cfff647;
    stim[25] = 43'h01200bbc5e9;
    stim[26] = 43'h5fb8e92cd6c;
    stim[27] = 43'h0993c2c7126;
    stim[28] = 43'h34bb75407a5;
    stim[29] = 43'h6996d5a81e0;
    stim[30] = 43'h542c80b0bcf;
    stim[31] = 43'h1795e1271ed;
    stim[32] = 43'h4e0bdbc3bee;
    stim[33] = 43'h3e02c5d2ab0;
    stim[34] = 43'h0825144b644;
    stim[35] = 43'h449bd3aae3a;
    stim[36] = 43'h3833faf1476;
    stim[37] = 43'h49171cc0fe3;
    stim[38] = 43'h1a3a11eec46;
    stim[39] = 43'h4fb9895be82;
    stim[40] = 43'h523c7618038;
    stim[41] = 43'h241d414e313;
    stim[42] = 43'h25182f97e6f;
    stim[43] = 43'h55118362563;
    stim[44] = 43'h0b9612440c1;
    stim[45] = 43'h360cbe22fea;
    stim[46] = 43'h0a10d168697;
    stim[47] = 43'h0fb4713d92f;
    stim[48] = 43'h649a66c81b5;
    stim[49] = 43'h280853417dd;
    stim[50] = 43'h3b357e7f52a;
    stim[51] = 43'h1f15d931fd9;
    stim[52] = 43'h3a3d39df6a6;
    stim[53] = 43'h353e9fcf9a2;
    stim[54] = 43'h1992523760f;
    stim[55] = 43'h28a4f3dc4d2;
    stim[56] = 43'h3993e9d8bbe;
    stim[57] = 43'h4196640726f;
    stim[58] = 43'h092b4bcf8e2;
    stim[59] = 43'h5b014c6cc3a;
    stim[60] = 43'h30896bde1a9;
    stim[61] = 43'h0b2aaf001d1;
    stim[62] = 43'h4a828bf6367;
    stim[63] = 43'h709520e4284;
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
      expv[0] = 32'h00000000;
      expv[1] = 32'h00000000;
      expv[2] = 32'h00000000;
      expv[3] = 32'h8e6c35d8;
      expv[4] = 32'h8e6c35d8;
      expv[5] = 32'hec5c8483;
      expv[6] = 32'hc86efb5a;
      expv[7] = 32'hf904f0ac;
      expv[8] = 32'hc707ab53;
      expv[9] = 32'h3460b75f;
      expv[10] = 32'h16856567;
      expv[11] = 32'h16856567;
      expv[12] = 32'hfee71c79;
      expv[13] = 32'h1afae5a4;
      expv[14] = 32'h1afae5a4;
      expv[15] = 32'h8a7adf8a;
      expv[16] = 32'he7b7c924;
      expv[17] = 32'ha6d3983f;
      expv[18] = 32'h00000000;
      expv[19] = 32'h00000000;
      expv[20] = 32'he5847a98;
      expv[21] = 32'hcfbf8cb9;
      expv[22] = 32'hcfbf8cb9;
      expv[23] = 32'h686dc999;
      expv[24] = 32'h3508fb45;
      expv[25] = 32'h3508fb45;
      expv[26] = 32'h3508fb45;
      expv[27] = 32'hc28e792d;
      expv[28] = 32'h5f00b5d4;
      expv[29] = 32'hb75407a5;
      expv[30] = 32'h7912480b;
      expv[31] = 32'h7912480b;
      expv[32] = 32'h07125bce;
      expv[33] = 32'h07125bce;
      expv[34] = 32'h07125bce;
      expv[35] = 32'h07125bce;
      expv[36] = 32'h400d45cd;
      expv[37] = 32'h3faf1476;
      expv[38] = 32'ha3ddb9ba;
      expv[39] = 32'ha11eec46;
      expv[40] = 32'h2c34124d;
      expv[41] = 32'h846fe32f;
      expv[42] = 32'hf7c098e0;
      expv[43] = 32'h82f97e6f;
      expv[44] = 32'h18362563;
      expv[45] = 32'h612440c1;
      expv[46] = 32'h612440c1;
      expv[47] = 32'h0d168697;
      expv[48] = 32'h4713d92f;
      expv[49] = 32'h4d466b77;
      expv[50] = 32'h4d466b77;
      expv[51] = 32'h57e7f52a;
      expv[52] = 32'h7b17805f;
      expv[53] = 32'hd39df6a6;
      expv[54] = 32'h729ea523;
      expv[55] = 32'hf4bc1508;
      expv[56] = 32'hf4bc1508;
      expv[57] = 32'h5aff305d;
      expv[58] = 32'h6640726f;
      expv[59] = 32'h6640726f;
      expv[60] = 32'hb3c20793;
      expv[61] = 32'hb3c20793;
      expv[62] = 32'hb3c20793;
      expv[63] = 32'h24edab5d;
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
