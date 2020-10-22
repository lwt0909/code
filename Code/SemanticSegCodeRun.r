# Original code:
#conda activate venv3;python tools/demo.py --cfg configs/panoptic_deeplab_X65_os32_cityscapes_lr_x10.yaml --input-files datasets/Sample_data_2.jpg --output-dir results --merge-image TEST.MODEL_FILE models/panoptic_deeplab_X65_os32_cityscapes_lr_x10.pth 

# Select folder containing data and code
P_data <- list.files("~/Kwanghun/Tasks/DeepLearning/lelab/Data/Yolo/SNU_Samples/", ".png$", full.names=T)
P_exec <- c("~/Kwanghun/Tasks/DeepLearning/panoptic-deeplab/")
P_out  <- c("/home/kwanghun/Kwanghun/Tasks/DeepLearning/lelab/Data/SemanticSegmentation/TestSNU/")

# Choose options for result image (0 = only semantic, 1 = image merge)
Options <- 0

# Tell which configure file and model for semantic segmentation
py_exec <- paste0(P_exec, "tools/demo.py")
py_conf <- paste0(P_exec, "configs/panoptic_deeplab_X65_os32_cityscapes_lr_x10.yaml")
py_modl <- paste0(P_exec, "models/panoptic_deeplab_X65_os32_cityscapes_lr_x10.pth")
py_optn <- function(x=0){ifelse(x==1, "--merge-image", "")}

# Code to run
py_code <- 
    function(py_data, py_exec, py_outD, py_conf, py_modl, py_opt=0){
        paste("python", py_exec, "--cfg", py_conf, "--input-files", py_data, "--output-dir", py_outD, py_optn(py_opt), "TEST.MODEL_FILE", py_modl, sep=" ")
    }

# To run with overall options
for(j in P_data){
    py_data <- j
    nm_data <- gsub(".png", "", tail(unlist(strsplit(py_data, "/", fixed=T)), 1))
    system(paste0("mkdir ", P_out,nm_data))
    for(i in c(0,1)){
        py_outD <- paste0(P_out, nm_data, "/", i)
        system(paste0("conda activate venv3;", py_code(py_data = j, py_exec, py_outD, py_conf, py_modl, py_opt = i)))
    }
}
j
