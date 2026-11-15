// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 140;
  localparam OW = 31;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_02947 dut (
    .b_cost_0_i(in_vec[139:112]),
    .b_cost_1_i(in_vec[111:84]),
    .b_cost_2_i(in_vec[83:56]),
    .b_cost_3_i(in_vec[55:28]),
    .b_cost_4_i(in_vec[27:0]),
    .b_cost_o(out_vec[30:3]),
    .b_band_o(out_vec[2:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 140'hf8b70c4af316469a3bf5c2d33b00c4f6ba2;
    stim[1] = 140'h9c03efb289ab232b36de5761ac694d016d6;
    stim[2] = 140'h032d58814ba977e384e182b0469d2a1f6db;
    stim[3] = 140'hc024115a2ef47d4c5c40da539bbc2d23b92;
    stim[4] = 140'h9de2f54729eb37f2eeea95af20cb87f74af;
    stim[5] = 140'h8faede0dfeef6c1e32adfadf7db16cbabd5;
    stim[6] = 140'he88a16b82a02f989ebcaabdb7e62322829b;
    stim[7] = 140'h3eb39ecc0076276a1e50440ec475e4b9048;
    stim[8] = 140'h043c976d57e96dbfa465db63c2b284311d5;
    stim[9] = 140'hbae2d71a3ddcc8f42da6c6edac9f8a83b1f;
    stim[10] = 140'h469966899a62fbc1a0cd780785669725b54;
    stim[11] = 140'hee255d26d4b602f9e0fdd3564c4aa535727;
    stim[12] = 140'ha9cd61c86c415590793b42ce76158002b7a;
    stim[13] = 140'h040f3950af31d88d9f9ff56ff2262c669de;
    stim[14] = 140'h34c7e8edd44808b5fee97e836243429477b;
    stim[15] = 140'hf8a11b96e07ac0c11bae0509ea688a2099a;
    stim[16] = 140'hf74d36bfaa7840ca8d299bd119bd8b20f90;
    stim[17] = 140'h497f939a3cc6968148e8db9e0edd8f5b7be;
    stim[18] = 140'h4fbee8910059838e394447752e320c123b2;
    stim[19] = 140'hebdec59dbfeb578e169eacbc4f76a44a820;
    stim[20] = 140'hf24c7227ecc9b2c240ccbe747e8dbefb607;
    stim[21] = 140'h91275d4a4c794e56ed74af00e955e9d8b98;
    stim[22] = 140'h99cac9d7564d0244cb63001f80585704b24;
    stim[23] = 140'hc128b972f8d7b8cdd28ce217acb83d5d2b7;
    stim[24] = 140'hd5be2d1155a89bc13936b42592b6e736863;
    stim[25] = 140'h2d6394c1e899327629955757ba5467b548f;
    stim[26] = 140'hbb81578d9bb817e8498d4c298735b35461b;
    stim[27] = 140'hcb8c84bf00d17b3bc56dd46c84ce561bbd3;
    stim[28] = 140'h6f02ac5ec05a8f9db9eff12ef39e1c688b6;
    stim[29] = 140'hd520ed4196aae715ed6fb3e821b6978845b;
    stim[30] = 140'h41362b2ffe5aa3f06e9bd9f8863fa604f13;
    stim[31] = 140'h8c72f829fd97768c0c5a3692d974af8a911;
    stim[32] = 140'ha8900423a1e5b2aa03c4e932ff4d55b55de;
    stim[33] = 140'h812402d3a3bb36f5919523b79a91f6986dd;
    stim[34] = 140'hde43f245360e43b4eca7c2ee6a04ca41260;
    stim[35] = 140'h173f21d29b90e5aebe21d8e23344d98268e;
    stim[36] = 140'h9e69c0a2554d48fe596a4a3a7da741305e4;
    stim[37] = 140'h363f07eb6810b480e86d04295b1ab249345;
    stim[38] = 140'hfede066f48a12acc25d224d94edb8170419;
    stim[39] = 140'he94cf38737052283d04e87f9258faa38a1c;
    stim[40] = 140'h403838bc1bedd1bfd829a93363430b14696;
    stim[41] = 140'hec9107c53da4c6263a0e522b497bf1db987;
    stim[42] = 140'h5c4e623fe6271e6933e0c87d669c2e3bc38;
    stim[43] = 140'h8f295445b9cd9422b01c5d18e0e9391eae1;
    stim[44] = 140'hcbda6b9a6dc897dc445e8d6d8f253c32a34;
    stim[45] = 140'hf660a8e0342b43e2d2718cbe28bba7b3171;
    stim[46] = 140'ha2ea11fa70ba5ef8bd9270cdd9b7eca224b;
    stim[47] = 140'h9db67d70e1ea21dda90a6ac8086f0e1dc17;
    stim[48] = 140'h852cf021dc26f4c37b870481c60b04099e2;
    stim[49] = 140'h0853912789d4e9635fc803d52497e817a9b;
    stim[50] = 140'h09a6bd6fc6f60c61bea367553ee38f725cb;
    stim[51] = 140'h8f6247ef353aa2514d6962e6eb1e5a4c18e;
    stim[52] = 140'hb06e12726790222c5f8b77d79936d48662f;
    stim[53] = 140'ha4a8167e6a72d86337accd00af79522ceb0;
    stim[54] = 140'hc66c69294150b3461803fab5e8df940ccbf;
    stim[55] = 140'h43f4ae18bd7c144330f839d66159892601d;
    stim[56] = 140'haeb9c89b5d71625d6dfda45aa8f3626dd60;
    stim[57] = 140'h4c9d8dfb328f41e49b678ca32150e3d4879;
    stim[58] = 140'h446c88782853d83e7413e7e18727116c73f;
    stim[59] = 140'h1d5347c98ca0282c45dd11bb9024417cd48;
    stim[60] = 140'h87345159a29ca4a34959ec029323e74b54b;
    stim[61] = 140'h135ce880ffa6c9e59c71bc37c2c5f5daf87;
    stim[62] = 140'h6813e701d81baa7f04186130e3c3655034b;
    stim[63] = 140'h7bd6f29d5519218fe08f3f517a2a9087c8c;
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
      expv[0] = 31'h4d1dfae2;
      expv[1] = 31'h4e01f7d8;
      expv[2] = 31'h71c270c2;
      expv[3] = 31'h5177a3e9;
      expv[4] = 31'h43fba57c;
      expv[5] = 31'h47d76f00;
      expv[6] = 31'h415017c9;
      expv[7] = 31'h6003b139;
      expv[8] = 31'h42188eac;
      expv[9] = 31'h4541d8fc;
      expv[10] = 31'h403c2b33;
      expv[11] = 31'h529ab93c;
      expv[12] = 31'h40015bd4;
      expv[13] = 31'h46cfcffa;
      expv[14] = 31'h5aff74ba;
      expv[15] = 31'h45104cd4;
      expv[16] = 31'h45907c84;
      expv[17] = 31'h40a4746a;
      expv[18] = 31'h471ca222;
      expv[19] = 31'h470b4f52;
      expv[20] = 31'h5f7db03c;
      expv[21] = 31'h4893aea0;
      expv[22] = 31'h4ce564e8;
      expv[23] = 31'h60945cb8;
      expv[24] = 31'h609c9b5a;
      expv[25] = 31'h0f44c991;
      expv[26] = 31'h59aa30dc;
      expv[27] = 31'h65c64258;
      expv[28] = 31'h4edcf7fa;
      expv[29] = 31'h4bc422dc;
      expv[30] = 31'h4fc431fb;
      expv[31] = 31'h46062d1a;
      expv[32] = 31'h4997fa6b;
      expv[33] = 31'h40920168;
      expv[34] = 31'h5a7653e2;
      expv[35] = 31'h47119a23;
      expv[36] = 31'h4f34e050;
      expv[37] = 31'h40743682;
      expv[38] = 31'h40b820cc;
      expv[39] = 31'h41e82742;
      expv[40] = 31'h499b1a1b;
      expv[41] = 31'h764883e0;
      expv[42] = 31'h43eb34e3;
      expv[43] = 31'h4794aa20;
      expv[44] = 31'h536e44b9;
      expv[45] = 31'h53d98b8c;
      expv[46] = 31'h517508f8;
      expv[47] = 31'h4edb3eb8;
      expv[48] = 31'h42967810;
      expv[49] = 31'h740bd4dc;
      expv[50] = 31'h47b92e5c;
      expv[51] = 31'h47b123f0;
      expv[52] = 31'h58370938;
      expv[53] = 31'h52540b38;
      expv[54] = 31'h4a0665fc;
      expv[55] = 31'h449300ec;
      expv[56] = 31'h575ce448;
      expv[57] = 31'h59947a09;
      expv[58] = 31'h41429ec1;
      expv[59] = 31'h4c650141;
      expv[60] = 31'h439a28a8;
      expv[61] = 31'h61be162b;
      expv[62] = 31'h09871e1b;
      expv[63] = 31'h47f0479a;
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
