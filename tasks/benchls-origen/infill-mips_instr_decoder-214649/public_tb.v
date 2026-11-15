// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 32;
  localparam OW = 68;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_214649 dut (
    .inst(in_vec[31:0]),
    .rs(out_vec[67:63]),
    .rt(out_vec[62:58]),
    .rd(out_vec[57:53]),
    .imm16(out_vec[52:37]),
    .imm26(out_vec[36:11]),
    .PCSrc(out_vec[10:9]),
    .RegWriteSrc(out_vec[8:7]),
    .RegWrite(out_vec[6:6]),
    .MemWrite(out_vec[5:5]),
    .ALUOperation(out_vec[4:3]),
    .RegDst(out_vec[2:1]),
    .ALUSrc(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 32'h1cfe7d3d;
    stim[1] = 32'h389ad06c;
    stim[2] = 32'h5931ca68;
    stim[3] = 32'h8eaaa3a7;
    stim[4] = 32'h570fe524;
    stim[5] = 32'hb32c22af;
    stim[6] = 32'hdb93d997;
    stim[7] = 32'h9fd5b1ac;
    stim[8] = 32'hced01988;
    stim[9] = 32'hd74498d4;
    stim[10] = 32'h223ca143;
    stim[11] = 32'ha5351116;
    stim[12] = 32'hbd35a170;
    stim[13] = 32'h2c32b96a;
    stim[14] = 32'haf332ec9;
    stim[15] = 32'h3f34b174;
    stim[16] = 32'he4276e9f;
    stim[17] = 32'h38b75afd;
    stim[18] = 32'h4abec9f9;
    stim[19] = 32'hbddb075e;
    stim[20] = 32'h93922d65;
    stim[21] = 32'hb52e6c84;
    stim[22] = 32'h3a9bb7da;
    stim[23] = 32'ha9e89f02;
    stim[24] = 32'h8fac49ee;
    stim[25] = 32'hc8d5aa23;
    stim[26] = 32'h241eacec;
    stim[27] = 32'hd4ce5ca5;
    stim[28] = 32'h1de1be7f;
    stim[29] = 32'hca8600ad;
    stim[30] = 32'h3da0b758;
    stim[31] = 32'h0a88809e;
    stim[32] = 32'hebd2f77b;
    stim[33] = 32'hf295cd52;
    stim[34] = 32'h24a961ba;
    stim[35] = 32'h6d48f179;
    stim[36] = 32'ha809589d;
    stim[37] = 32'h568f7b0a;
    stim[38] = 32'h86c095cd;
    stim[39] = 32'h8fee520e;
    stim[40] = 32'hd604a77b;
    stim[41] = 32'h2220ecfe;
    stim[42] = 32'h4c575d18;
    stim[43] = 32'h703b0d55;
    stim[44] = 32'h63f3ee75;
    stim[45] = 32'h2e628954;
    stim[46] = 32'h411623a9;
    stim[47] = 32'ha43bd3f5;
    stim[48] = 32'h9aabc253;
    stim[49] = 32'h67e5d72f;
    stim[50] = 32'ha66c8f37;
    stim[51] = 32'h8cadcd92;
    stim[52] = 32'h24854f7b;
    stim[53] = 32'h72c81d4e;
    stim[54] = 32'h9a48b958;
    stim[55] = 32'hfe82c9f4;
    stim[56] = 32'h36cbe9aa;
    stim[57] = 32'h6fc4ae52;
    stim[58] = 32'h54ce2172;
    stim[59] = 32'hd74ed0bb;
    stim[60] = 32'h3733304a;
    stim[61] = 32'ha7a5c2f9;
    stim[62] = 32'ha027a6a1;
    stim[63] = 32'h222418b2;
    for (c = 0; c < N; c = c + 1) begin
      in_vec = stim[c];
      #1 sample;
      #1;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 68'h3f9efa7a7f3e9exxx;
      expv[1] = 68'h26b5a0d84d6836xxx;
      expv[2] = 68'h4c7394d098e534xxx;
      expv[3] = 68'haaa9474f5551d38c1;
      expv[4] = 68'hc3f9ca4987f2920c1;
      expv[5] = 68'hcb08455f9611578c1;
      expv[6] = 68'he4f7b32fc9eccb8c1;
      expv[7] = 68'hf56d6359ead8d60c1;
      expv[8] = 68'hb4063311680cc40c1;
      expv[9] = 68'hd12731a9a24c6a0c1;
      expv[10] = 68'h8f2942871e50a18c1;
      expv[11] = 68'h4d44222c9a888b0c1;
      expv[12] = 68'h4d6942e09ad0b80c1;
      expv[13] = 68'h0caf72d4195cb50c1;
      expv[14] = 68'hccca5d93999764821;
      expv[15] = 68'hcd2d62e99a58ba159;
      expv[16] = 68'h09dadd3e13b74f959;
      expv[17] = 68'h2dd6b5fa5bad7e959;
      expv[18] = 68'hafb393f35f64fc959;
      expv[19] = 68'h76c00ebced83af159;
      expv[20] = 68'he48a5acbc916b2959;
      expv[21] = 68'h4b9ad908973642159;
      expv[22] = 68'ha6ed6fb54ddbed159;
      expv[23] = 68'h7a273e04f44f81159;
      expv[24] = 68'heb1293ddd624f70c1;
      expv[25] = 68'h356b54466ad5118c1;
      expv[26] = 68'h07ab59d80f56760c1;
      expv[27] = 68'h3396b94a672e528c1;
      expv[28] = 68'h786f7cfef0df3f8c1;
      expv[29] = 68'ha180015b4300568c1;
      expv[30] = 68'h682d6eb0d05bac159;
      expv[31] = 68'ha221013d44404f7c4;
      expv[32] = 68'hf4bdeef7e97bbdfc4;
      expv[33] = 68'ha5739aa54ae6a97c4;
      expv[34] = 68'h2a58c37454b0dd7c4;
      expv[35] = 68'h523de2f2a478bcfc4;
      expv[36] = 68'h0256b13a04ac4efc4;
      expv[37] = 68'ha3def61547bd857c4;
      expv[38] = 68'hb0252b9b604ae6fc4;
      expv[39] = 68'hfb94a41df729070c1;
      expv[40] = 68'h81294ef70253bd8c1;
      expv[41] = 68'h883bd9fd10767f0c1;
      expv[42] = 68'h15d6ba302bae8c0c1;
      expv[43] = 68'h0ec21aaa1d86aa8c1;
      expv[44] = 68'hfcfbdcebf9f73a8c1;
      expv[45] = 68'h98a312a93144aa0c1;
      expv[46] = 68'h458847528b11d48c1;
      expv[47] = 68'h0ef5a7ea1de9fa8c1;
      expv[48] = 68'haaf184a755e1298c1;
      expv[49] = 68'hf975ae5ff2eb978c1;
      expv[50] = 68'h9b231e6f36479b8c1;
      expv[51] = 68'h2b739b2456e6c90c1;
      expv[52] = 68'h21529ef642a7bd8c1;
      expv[53] = 68'hb2063a9d640ea70c1;
      expv[54] = 68'h922f72b1245cac0c1;
      expv[55] = 68'ha0b393e94164fa0c1;
      expv[56] = 68'hb2fbd35565f4d5051;
      expv[57] = 68'hf12b5ca5e25729051;
      expv[58] = 68'h338842e46710b9051;
      expv[59] = 68'hd3b5a177a7685d851;
      expv[60] = 68'hcccc6095999825051;
      expv[61] = 68'he97185f3d2e17c851;
      expv[62] = 68'h09e94d4213d350851;
      expv[63] = 68'h89063165120c59051;
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
