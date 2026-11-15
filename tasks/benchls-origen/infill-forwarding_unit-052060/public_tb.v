// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 124;
  localparam OW = 6;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_052060 dut (
    .RegWrite_EX_MEM(in_vec[123:123]),
    .RegWrite_MEM_WB(in_vec[122:122]),
    .RegWrite_ID_EX(in_vec[121:121]),
    .RS_ID_EX(in_vec[120:116]),
    .RT_ID_EX(in_vec[115:111]),
    .RS_IF_ID(in_vec[110:106]),
    .RegRd_MEM_WB(in_vec[105:101]),
    .PCSrc(in_vec[100:99]),
    .ID_EX_RegDst(in_vec[98:98]),
    .MEM_WB_RegDst(in_vec[97:97]),
    .EX_MEM_RegDst(in_vec[96:96]),
    .instruction_ID_EX(in_vec[95:64]),
    .instruction_EX_MEM(in_vec[63:32]),
    .instruction_MEM_WB(in_vec[31:0]),
    .ForwardA(out_vec[5:4]),
    .ForwardB(out_vec[3:2]),
    .ForwardJR(out_vec[1:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 124'h3326232ceea1c2568c1e7840ea587d7;
    stim[1] = 124'h1c29ebcc103a7cd12592e48aef385f2;
    stim[2] = 124'hb978043e801972eabf58226dd25d356;
    stim[3] = 124'h1d371d6cc87b0ffe7c54ff0f26dc5d1;
    stim[4] = 124'h358f0d5bb3f2c7c3b64caccba8fb31f;
    stim[5] = 124'hc6dbfe808d74d7a41f6c8a54cac03ae;
    stim[6] = 124'h0f835a1a8c9591e4c30816cf420e30b;
    stim[7] = 124'hf4bc932743a3c73ad66f39020f6b46f;
    stim[8] = 124'h8aaf8e57bc2ed836ce607495f2c6fd3;
    stim[9] = 124'hc9940c8701266f6a48c1e95ba887eb7;
    stim[10] = 124'hd5dcf83f0b97ea69f59c57a5e8da183;
    stim[11] = 124'h4145d77c5d4e2e1849d0fb7d0f169d0;
    stim[12] = 124'he77ea19af22ed995a2d76f97cf8e5c2;
    stim[13] = 124'hde3851d90ca4a21d380d19d2063529e;
    stim[14] = 124'h4dd01d0f119f391ee635c1042ab19cb;
    stim[15] = 124'hd3fde173ac817f2881bf1990af4608f;
    stim[16] = 124'h355401f08d84d6e29eeb837789a6713;
    stim[17] = 124'h1d483d245fe537eed83d3dcf676a678;
    stim[18] = 124'hec334eaa9b19c009bd6b84614320611;
    stim[19] = 124'hb7c4bd1f314a557a12399115cb7e9eb;
    stim[20] = 124'h15c59b5f29d7aed7d44db3883f3f3ca;
    stim[21] = 124'h682bd87514460de10d6b5c8034ed414;
    stim[22] = 124'hea79f6fc889ffe4e4f8c2498c0cd819;
    stim[23] = 124'hdce655d5024d8d86c360c613cc0428f;
    stim[24] = 124'h8707b8c2409766793465e0f69921d34;
    stim[25] = 124'h446c17c4c555572c8028f7a1e70e14b;
    stim[26] = 124'h172f4dc203ff23085f37fd195b6bbdb;
    stim[27] = 124'hf1324e27f264a19d6a421822cccfbe8;
    stim[28] = 124'h6bd157a68f126d481bd5a569c0475fd;
    stim[29] = 124'he2786ae9f6ec24275255cb0013248e2;
    stim[30] = 124'h2f3b8cebfc581c8eba6d1563fd1a0d7;
    stim[31] = 124'h06fc6126a03bb143f0e8a4578b33f5d;
    stim[32] = 124'hbef9a7fd396937f3540594b40b73d52;
    stim[33] = 124'hb4b1c401eeac06891acac3204b27e2e;
    stim[34] = 124'h727d509f0348655baf67a72088d7e2c;
    stim[35] = 124'h2af21229e1eed1d606efd30aafa7325;
    stim[36] = 124'h046a225c86d1f996713f914e18108e0;
    stim[37] = 124'h84ba9a02e38f61a55b7e3f2fa9c1a73;
    stim[38] = 124'h4b17e0e8bbf2b07f44eaee1520130ef;
    stim[39] = 124'h9d8593d03e7ba729ea86ae8c5ee40c9;
    stim[40] = 124'h4902abb7927b7e3e8646cfd048600d2;
    stim[41] = 124'ha39c2667e802e76e36a6afbcdcfb7ff;
    stim[42] = 124'h6480362f9d6650f0e4ba660e7ef9753;
    stim[43] = 124'he7d96bcb6fc44965cd409737cf98d34;
    stim[44] = 124'h548900f4d7ce5c46545af37a6c8aeac;
    stim[45] = 124'ha1b376dfea1897a665511d582bbc4b6;
    stim[46] = 124'h3f921fd0f59fe05bbcc963555a111fa;
    stim[47] = 124'ha8f43f9505262991500ca69e070d427;
    stim[48] = 124'hf5850bf8e5b834361918efd614f3362;
    stim[49] = 124'h422ab3aa2d4fc9839219b2ebee90543;
    stim[50] = 124'h8c9ec9aeb41c72b4adc10b9282265de;
    stim[51] = 124'hc5242eeb3dc3d2e4633456be7e70bde;
    stim[52] = 124'h5bc7985e6b98f8a3dc067d4e36a43e3;
    stim[53] = 124'h7a41ca28f3093a88566a311fdae1b4f;
    stim[54] = 124'ha745fa0f59f3596274b7604ada26c55;
    stim[55] = 124'h7191323c762df0aa699e3eda86edc8f;
    stim[56] = 124'h187fe8610380e6f7ce126103064ce44;
    stim[57] = 124'h052a03a8d42a74a5104aa014d657fe9;
    stim[58] = 124'h015637c003c07fca368dbc334dd4623;
    stim[59] = 124'hc9629d464e0abfca25faed7e3e601cd;
    stim[60] = 124'h2a50a4c0a3487d522120329aa01acb6;
    stim[61] = 124'hb0d202387a5606b5939ee54414ec8a6;
    stim[62] = 124'ha0c44a68a5a1db6f146822188833755;
    stim[63] = 124'h8108e5f091be9959c74c0fcbb34f343;
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
      expv[0] = 6'h00;
      expv[1] = 6'h00;
      expv[2] = 6'h00;
      expv[3] = 6'h00;
      expv[4] = 6'h00;
      expv[5] = 6'h00;
      expv[6] = 6'h00;
      expv[7] = 6'h00;
      expv[8] = 6'h00;
      expv[9] = 6'h00;
      expv[10] = 6'h00;
      expv[11] = 6'h00;
      expv[12] = 6'h00;
      expv[13] = 6'h00;
      expv[14] = 6'h00;
      expv[15] = 6'h00;
      expv[16] = 6'h00;
      expv[17] = 6'h00;
      expv[18] = 6'h00;
      expv[19] = 6'h00;
      expv[20] = 6'h00;
      expv[21] = 6'h00;
      expv[22] = 6'h00;
      expv[23] = 6'h00;
      expv[24] = 6'h00;
      expv[25] = 6'h01;
      expv[26] = 6'h00;
      expv[27] = 6'h00;
      expv[28] = 6'h00;
      expv[29] = 6'h00;
      expv[30] = 6'h00;
      expv[31] = 6'h00;
      expv[32] = 6'h00;
      expv[33] = 6'h00;
      expv[34] = 6'h00;
      expv[35] = 6'h00;
      expv[36] = 6'h00;
      expv[37] = 6'h08;
      expv[38] = 6'h00;
      expv[39] = 6'h00;
      expv[40] = 6'h00;
      expv[41] = 6'h00;
      expv[42] = 6'h00;
      expv[43] = 6'h00;
      expv[44] = 6'h00;
      expv[45] = 6'h00;
      expv[46] = 6'h00;
      expv[47] = 6'h00;
      expv[48] = 6'h00;
      expv[49] = 6'h00;
      expv[50] = 6'h00;
      expv[51] = 6'h00;
      expv[52] = 6'h00;
      expv[53] = 6'h00;
      expv[54] = 6'h00;
      expv[55] = 6'h00;
      expv[56] = 6'h00;
      expv[57] = 6'h00;
      expv[58] = 6'h00;
      expv[59] = 6'h00;
      expv[60] = 6'h00;
      expv[61] = 6'h00;
      expv[62] = 6'h00;
      expv[63] = 6'h00;
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
