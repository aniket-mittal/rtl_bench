// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 32;
  localparam OW = 11;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_210432 dut (
    .CLK(clk),
    .instruction(in_vec[31:0]),
    .Instruction_type(out_vec[10:8]),
    .Dataprocessing_instr_type(out_vec[7:4]),
    .Memory_instr_type(out_vec[3:2]),
    .Jump_instr_type(out_vec[1:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 32'hc9b98361;
    stim[1] = 32'haa3a5794;
    stim[2] = 32'hba385188;
    stim[3] = 32'hc224ec48;
    stim[4] = 32'h273cda14;
    stim[5] = 32'he44bc411;
    stim[6] = 32'h3bee6ef8;
    stim[7] = 32'hdda07840;
    stim[8] = 32'he75d7559;
    stim[9] = 32'ha1a64b3c;
    stim[10] = 32'hab18595f;
    stim[11] = 32'h823a321e;
    stim[12] = 32'hc2d97607;
    stim[13] = 32'h03291591;
    stim[14] = 32'h69893a46;
    stim[15] = 32'h726f441d;
    stim[16] = 32'h2023b3d5;
    stim[17] = 32'h6f5961d7;
    stim[18] = 32'h48c91201;
    stim[19] = 32'he86c200a;
    stim[20] = 32'ha3ceebf5;
    stim[21] = 32'hc65c7b15;
    stim[22] = 32'h63dfa979;
    stim[23] = 32'h159acc9b;
    stim[24] = 32'hd1d6f86d;
    stim[25] = 32'hf9bf60ee;
    stim[26] = 32'h20e3e70d;
    stim[27] = 32'hdf875599;
    stim[28] = 32'h4ce6caa4;
    stim[29] = 32'h602568f0;
    stim[30] = 32'h4900e5bc;
    stim[31] = 32'hef73f1bf;
    stim[32] = 32'hab31c6a5;
    stim[33] = 32'h371fc3e8;
    stim[34] = 32'he74aa194;
    stim[35] = 32'hd0bef1eb;
    stim[36] = 32'h2fa1161d;
    stim[37] = 32'hba98b343;
    stim[38] = 32'h7a712ee1;
    stim[39] = 32'h772acd3b;
    stim[40] = 32'h17666ab0;
    stim[41] = 32'h63ee65b7;
    stim[42] = 32'h8be88016;
    stim[43] = 32'hfc5ef658;
    stim[44] = 32'h8b2d7624;
    stim[45] = 32'h99725828;
    stim[46] = 32'hf29d9d66;
    stim[47] = 32'h88ac7a1b;
    stim[48] = 32'h95a6bab1;
    stim[49] = 32'hb2760339;
    stim[50] = 32'h52a99021;
    stim[51] = 32'hd24d92b2;
    stim[52] = 32'h4f2b53ee;
    stim[53] = 32'he448798f;
    stim[54] = 32'habadec8a;
    stim[55] = 32'h4a0d71d8;
    stim[56] = 32'h5ae66df4;
    stim[57] = 32'hd4647c45;
    stim[58] = 32'h0a05e851;
    stim[59] = 32'hab5e252d;
    stim[60] = 32'h507eb45a;
    stim[61] = 32'h8a74aca2;
    stim[62] = 32'h65549fbf;
    stim[63] = 32'h659b1c33;
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
      expv[0] = 11'h31x;
      expv[1] = 11'h31x;
      expv[2] = 11'h31x;
      expv[3] = 11'h11x;
      expv[4] = 11'h219;
      expv[5] = 11'h215;
      expv[6] = 11'h316;
      expv[7] = 11'h016;
      expv[8] = 11'h21a;
      expv[9] = 11'h11a;
      expv[10] = 11'h31a;
      expv[11] = 11'h11a;
      expv[12] = 11'h11a;
      expv[13] = 11'h12a;
      expv[14] = 11'h32a;
      expv[15] = 11'h11a;
      expv[16] = 11'h11a;
      expv[17] = 11'h01a;
      expv[18] = 11'h319;
      expv[19] = 11'h319;
      expv[20] = 11'h119;
      expv[21] = 11'h219;
      expv[22] = 11'h119;
      expv[23] = 11'h219;
      expv[24] = 11'h119;
      expv[25] = 11'h31a;
      expv[26] = 11'h11a;
      expv[27] = 11'h01a;
      expv[28] = 11'h01a;
      expv[29] = 11'h11a;
      expv[30] = 11'h31a;
      expv[31] = 11'h01a;
      expv[32] = 11'h31a;
      expv[33] = 11'h21a;
      expv[34] = 11'h216;
      expv[35] = 11'h116;
      expv[36] = 11'h016;
      expv[37] = 11'h315;
      expv[38] = 11'h315;
      expv[39] = 11'h215;
      expv[40] = 11'h215;
      expv[41] = 11'h115;
      expv[42] = 11'h316;
      expv[43] = 11'h016;
      expv[44] = 11'h316;
      expv[45] = 11'h316;
      expv[46] = 11'h116;
      expv[47] = 11'h315;
      expv[48] = 11'h215;
      expv[49] = 11'h115;
      expv[50] = 11'h115;
      expv[51] = 11'h115;
      expv[52] = 11'h015;
      expv[53] = 11'h215;
      expv[54] = 11'h316;
      expv[55] = 11'h315;
      expv[56] = 11'h315;
      expv[57] = 11'h215;
      expv[58] = 11'h315;
      expv[59] = 11'h316;
      expv[60] = 11'h116;
      expv[61] = 11'h315;
      expv[62] = 11'h219;
      expv[63] = 11'h219;
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
