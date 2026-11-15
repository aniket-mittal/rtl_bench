// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 73;
  localparam OW = 97;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_048769 dut (
    .clk(clk),
    .rst(in_vec[72:72]),
    .port_i(in_vec[71:40]),
    .s_wb_adr_i(in_vec[39:38]),
    .s_wb_dat_i(in_vec[37:6]),
    .s_wb_we_i(in_vec[5:5]),
    .s_wb_sel_i(in_vec[4:1]),
    .s_wb_stb_i(in_vec[0:0]),
    .port_o(out_vec[96:65]),
    .port_t(out_vec[64:33]),
    .s_wb_dat_o(out_vec[32:1]),
    .s_wb_ack_o(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 73'h1fa27fefe3ab6e81d12;
    stim[1] = 73'h1db2bb66e1b6efdd91d;
    stim[2] = 73'h0a4a5c171b977d6b6ea;
    stim[3] = 73'h04e3f8526b2f91cbf56;
    stim[4] = 73'h00f1b1c78d2ad6b10b4;
    stim[5] = 73'h0b748a9aa248cf46e9f;
    stim[6] = 73'h0f7c96e08552691caf6;
    stim[7] = 73'h072e06e4238bd900147;
    stim[8] = 73'h0e8db9695e78aada091;
    stim[9] = 73'h061a6d355646952ebbe;
    stim[10] = 73'h0022216bfd02eb42770;
    stim[11] = 73'h0a85772233adeed8af6;
    stim[12] = 73'h03a98a6ba77df3ba402;
    stim[13] = 73'h11adc0cd73bcbee9815;
    stim[14] = 73'h0a248721dfd8fe2d781;
    stim[15] = 73'h0976ee46f490f0f3a7d;
    stim[16] = 73'h01f4b14b0407ad30e3e;
    stim[17] = 73'h098091d6f31f5f24ed5;
    stim[18] = 73'h0be7cac8c7d906fbffe;
    stim[19] = 73'h046ee4a8ad19211655b;
    stim[20] = 73'h0a568931029f40fdabd;
    stim[21] = 73'h0e6a37e13346aafcf23;
    stim[22] = 73'h09c86eed779f18f5a72;
    stim[23] = 73'h04ff5435b5a1f0717b4;
    stim[24] = 73'h0f5dde1d2926563efcb;
    stim[25] = 73'h0ae9e18efabd5a95a76;
    stim[26] = 73'h042382d85464221c3b2;
    stim[27] = 73'h010088fcc6f34e3dc25;
    stim[28] = 73'h0ec4d1c514a682b1c48;
    stim[29] = 73'h02a01e219cd879240dd;
    stim[30] = 73'h112b0f9881712a5a506;
    stim[31] = 73'h046be5a69383f208b9c;
    stim[32] = 73'h0bb854d084e7a800aa8;
    stim[33] = 73'h096ec6edd9c60bb8113;
    stim[34] = 73'h026a7053dd20942be84;
    stim[35] = 73'h002cce7aa0d2d2de003;
    stim[36] = 73'h074f8a997c8ce9e8bb8;
    stim[37] = 73'h074f5369272ad9e3c97;
    stim[38] = 73'h0f3d39ed0f567e80ab1;
    stim[39] = 73'h0cc4103c050d506a277;
    stim[40] = 73'h0fdf85e845f0ce9f0db;
    stim[41] = 73'h097f59c87a9bb10a5d3;
    stim[42] = 73'h03e31006b2b73c59697;
    stim[43] = 73'h172c93bc8f7058d4f42;
    stim[44] = 73'h08eef1091182fb0ed13;
    stim[45] = 73'h0a1cd8194f4a0ec2536;
    stim[46] = 73'h0fe7666a4c429a3ff20;
    stim[47] = 73'h080255ab5a4fe231b2d;
    stim[48] = 73'h1d64bd1b9e6007a1bf0;
    stim[49] = 73'h09d12c22f9a7812f6dd;
    stim[50] = 73'h0328759b83678519245;
    stim[51] = 73'h04221b9080d595d986b;
    stim[52] = 73'h01ea54bbe7869c32e56;
    stim[53] = 73'h0a3cce85451e27c3dae;
    stim[54] = 73'h0d732c50e96df31b193;
    stim[55] = 73'h0d0e08eede9bf6a9d74;
    stim[56] = 73'h0a334043432e10c056c;
    stim[57] = 73'h0640d57cb829d7b1a52;
    stim[58] = 73'h0c3ee1e1833148850a4;
    stim[59] = 73'h0e7835c08cab6fe4b2e;
    stim[60] = 73'h0f5c3936e41b46fe293;
    stim[61] = 73'h03854b462f2e47974b3;
    stim[62] = 73'h0e6aca1324c69c2188e;
    stim[63] = 73'h0daa9eb8d2b510f9db7;
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
      expv[0] = 97'hxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[1] = 97'h00000000000000001ffffffff;
      expv[2] = 97'h0000000000000000000000000;
      expv[3] = 97'h0000000000000000000000000;
      expv[4] = 97'h0000000000000000000000000;
      expv[5] = 97'h00000000000000001ffffffff;
      expv[6] = 97'h00000000000000001ef92dc10;
      expv[7] = 97'h00000000000000001ffffffff;
      expv[8] = 97'h0000000000000000000000001;
      expv[9] = 97'h00000000000000000c34da6aa;
      expv[10] = 97'h0000000000000000000000000;
      expv[11] = 97'h00000000000000001fffffffe;
      expv[12] = 97'h0000000000000000075314d74;
      expv[13] = 97'h00000000000000001ffffffff;
      expv[14] = 97'h0000000000000000000000001;
      expv[15] = 97'h000000000000000012eddc8df;
      expv[16] = 97'h000000000000000003e962960;
      expv[17] = 97'h00000000000000001ffffffff;
      expv[18] = 97'h000000000000000017cf95918;
      expv[19] = 97'h0000000000000000000000001;
      expv[20] = 97'h00000000000000001ffffffff;
      expv[21] = 97'h000000000b05f812b4fa07ed5;
      expv[22] = 97'h0000000005caa8187390dddae;
      expv[23] = 97'h0000000005caa81869fea86b6;
      expv[24] = 97'h0000000005caa818600000001;
      expv[25] = 97'h0000000005caa818600000000;
      expv[26] = 97'h0000000005caa818684705b0a;
      expv[27] = 97'h0000000005caa818620111f99;
      expv[28] = 97'h0000000005caa8187d89a38a2;
      expv[29] = 97'h0000000005caa818600000001;
      expv[30] = 97'h0000000005caa8187a3557e78;
      expv[31] = 97'h00000000000000001fffffffe;
      expv[32] = 97'h00000000000000001770a9a10;
      expv[33] = 97'h0000000000000000000000001;
      expv[34] = 97'h0000000000000000000000000;
      expv[35] = 97'h00000000000000001ffffffff;
      expv[36] = 97'h0000000000000000000000000;
      expv[37] = 97'h00000000000000000e9ea6d25;
      expv[38] = 97'h0000000000000000000000001;
      expv[39] = 97'h0000000000000000198820781;
      expv[40] = 97'h00000000000000001fbf0bd09;
      expv[41] = 97'h0000000000000000000000001;
      expv[42] = 97'h00000000000000001ffffffff;
      expv[43] = 97'h0000000000000000000000000;
      expv[44] = 97'h00000000000000001ffffffff;
      expv[45] = 97'h0000000000000000000000000;
      expv[46] = 97'h0000000000000000000000000;
      expv[47] = 97'h0000000000000000000000001;
      expv[48] = 97'h127f118d80000000127f118d8;
      expv[49] = 97'h0000000000000000000000001;
      expv[50] = 97'h00000000000000001ffffffff;
      expv[51] = 97'h00000000000000001ffffffff;
      expv[52] = 97'h0000000019535133c3d4a977c;
      expv[53] = 97'h0000000019535133d4799d0a8;
      expv[54] = 97'h0000000019535133c00000001;
      expv[55] = 97'h0000000019535133c00000000;
      expv[56] = 97'h0000000019535133c6acaecc2;
      expv[57] = 97'h0000000019535133c00000000;
      expv[58] = 97'h0000000019535133c6acaecc2;
      expv[59] = 97'h0000000019535133c00000000;
      expv[60] = 97'h0000000019535133deb8726dd;
      expv[61] = 97'h0000000019535133c00000001;
      expv[62] = 97'h0000000019535133dcd594264;
      expv[63] = 97'h0000000019535133c6acaecc3;
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
