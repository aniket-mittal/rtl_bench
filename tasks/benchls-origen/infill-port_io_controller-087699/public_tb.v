// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 36;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_087699 dut (
    .clk_sys(clk),
    .reset(in_vec[35:35]),
    .addr(in_vec[34:33]),
    .we_n(in_vec[32:32]),
    .idata(in_vec[31:24]),
    .ipa(in_vec[23:16]),
    .ipb(in_vec[15:8]),
    .ipc(in_vec[7:0]),
    .odata(out_vec[31:24]),
    .opa(out_vec[23:16]),
    .opb(out_vec[15:8]),
    .opc(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 36'hf120b05cc;
    stim[1] = 36'hc7669ae60;
    stim[2] = 36'h323f2b5af;
    stim[3] = 36'h402a51c21;
    stim[4] = 36'h1a157b54a;
    stim[5] = 36'h571031514;
    stim[6] = 36'h1304c0797;
    stim[7] = 36'h7e40672e9;
    stim[8] = 36'h6c4253f5a;
    stim[9] = 36'h0096bd7cb;
    stim[10] = 36'h19de8eb86;
    stim[11] = 36'h753fa8048;
    stim[12] = 36'h44926ace4;
    stim[13] = 36'h28b01c7a7;
    stim[14] = 36'h4bcfa07f0;
    stim[15] = 36'h6fff8a907;
    stim[16] = 36'h0606de2d7;
    stim[17] = 36'h332d95922;
    stim[18] = 36'h56879ed13;
    stim[19] = 36'h45d7a51fc;
    stim[20] = 36'h3bb7df629;
    stim[21] = 36'h0073e0774;
    stim[22] = 36'h584ddb691;
    stim[23] = 36'h17a967b6b;
    stim[24] = 36'h611ef09a5;
    stim[25] = 36'h6e808f6c6;
    stim[26] = 36'h5b0a9464b;
    stim[27] = 36'h7dd8364c6;
    stim[28] = 36'h7e879ed5e;
    stim[29] = 36'h2e16e4dcc;
    stim[30] = 36'hfd01a628a;
    stim[31] = 36'h2e7fcbed1;
    stim[32] = 36'h99a650b8a;
    stim[33] = 36'h30b14b653;
    stim[34] = 36'h3737b2998;
    stim[35] = 36'h692b0b43b;
    stim[36] = 36'h61c424151;
    stim[37] = 36'h03070a30f;
    stim[38] = 36'h72a4ca783;
    stim[39] = 36'h7fb149984;
    stim[40] = 36'h64a5a8c14;
    stim[41] = 36'h6ddd4450e;
    stim[42] = 36'h45791a37b;
    stim[43] = 36'h42866dbda;
    stim[44] = 36'h139f49383;
    stim[45] = 36'h0b217bd2a;
    stim[46] = 36'h151c93eec;
    stim[47] = 36'h671cc971e;
    stim[48] = 36'h45bcedd35;
    stim[49] = 36'h7ed823c5b;
    stim[50] = 36'h7926390be;
    stim[51] = 36'h10a49ca88;
    stim[52] = 36'h66649d583;
    stim[53] = 36'h0d8066fef;
    stim[54] = 36'h5ff581932;
    stim[55] = 36'h4693ce386;
    stim[56] = 36'h24c1d3b8e;
    stim[57] = 36'h48596b92a;
    stim[58] = 36'h0a9c1b8c4;
    stim[59] = 36'h67474ce54;
    stim[60] = 36'h353dc37e8;
    stim[61] = 36'h77ff81804;
    stim[62] = 36'h4271aa130;
    stim[63] = 36'h3e96eb473;
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
      expv[0] = 32'hffffffff;
      expv[1] = 32'h60ffffff;
      expv[2] = 32'hb5ffffff;
      expv[3] = 32'h21ffffff;
      expv[4] = 32'h57ffffff;
      expv[5] = 32'h14ffffff;
      expv[6] = 32'h4cffffff;
      expv[7] = 32'hffffffff;
      expv[8] = 32'hffffffff;
      expv[9] = 32'h00000000;
      expv[10] = 32'h09090000;
      expv[11] = 32'hc4090000;
      expv[12] = 32'h00090000;
      expv[13] = 32'h00090049;
      expv[14] = 32'h49098b49;
      expv[15] = 32'hc4098bbc;
      expv[16] = 32'h6dffffff;
      expv[17] = 32'h59ffffff;
      expv[18] = 32'h13ffffff;
      expv[19] = 32'hfcffffff;
      expv[20] = 32'hf6ffffff;
      expv[21] = 32'h3effffff;
      expv[22] = 32'h91ffffff;
      expv[23] = 32'h96ffffff;
      expv[24] = 32'hffffffff;
      expv[25] = 32'hffffffff;
      expv[26] = 32'h400000f0;
      expv[27] = 32'he80000f0;
      expv[28] = 32'he80000f0;
      expv[29] = 32'h000000f0;
      expv[30] = 32'hffffffff;
      expv[31] = 32'hbeffffff;
      expv[32] = 32'h65ffffff;
      expv[33] = 32'hb6ffffff;
      expv[34] = 32'h29ffffff;
      expv[35] = 32'hffffffff;
      expv[36] = 32'h92ffff00;
      expv[37] = 32'h70ffff00;
      expv[38] = 32'h92ffff00;
      expv[39] = 32'h92ffff00;
      expv[40] = 32'h92ffff00;
      expv[41] = 32'h92ffff00;
      expv[42] = 32'h7bff00ff;
      expv[43] = 32'hdaff00ff;
      expv[44] = 32'hf4ff00ff;
      expv[45] = 32'h17ff00ff;
      expv[46] = 32'hc9ff00ff;
      expv[47] = 32'hddff00ff;
      expv[48] = 32'h35ff00ff;
      expv[49] = 32'hddff00ff;
      expv[50] = 32'hddff00ff;
      expv[51] = 32'h49ff00ff;
      expv[52] = 32'hddff00ff;
      expv[53] = 32'h06ff00ff;
      expv[54] = 32'h32ff00ff;
      expv[55] = 32'h86ff00ff;
      expv[56] = 32'h00ff00ff;
      expv[57] = 32'h2aff4cff;
      expv[58] = 32'hc1ff4cff;
      expv[59] = 32'hddff4cff;
      expv[60] = 32'h4cff4cff;
      expv[61] = 32'hddff4cff;
      expv[62] = 32'h30ff4cff;
      expv[63] = 32'h4cff4cff;
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
